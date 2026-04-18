#!/usr/bin/env bash
# One-shot: create the GitHub repo, push, enable Pages.
# Requires: gh CLI (authenticated) — https://cli.github.com

set -e

REPO="Xyla-and-Mimi"
DESC="A letter from Daddy — interactive love experience for Mimi & Xyla."

cd "$(dirname "$0")"

echo "→ initializing git"
if [ ! -d .git ]; then
  git init -b main >/dev/null
fi
git add -A
if git diff --cached --quiet; then
  echo "  (no changes to commit)"
else
  git commit -m "initial commit — For Mimi & Xyla v1.0.0" >/dev/null
fi

echo "→ creating GitHub repo '$REPO' and pushing"
if gh repo view "$REPO" >/dev/null 2>&1; then
  echo "  repo already exists — pushing to existing"
  git remote add origin "$(gh repo view $REPO --json sshUrl -q .sshUrl 2>/dev/null || echo "https://github.com/$(gh api user -q .login)/$REPO.git")" 2>/dev/null || true
  git push -u origin main
else
  gh repo create "$REPO" --public --source=. --push --description "$DESC"
fi

echo "→ enabling Pages via workflow (actions/deploy-pages)"
# The workflow in .github/workflows/pages.yml will handle deploy.
# Ensure Pages is set to 'GitHub Actions' source:
OWNER=$(gh api user -q .login)
gh api -X POST "repos/$OWNER/$REPO/pages" -f "build_type=workflow" >/dev/null 2>&1 || \
  gh api -X PUT "repos/$OWNER/$REPO/pages" -f "build_type=workflow" >/dev/null 2>&1 || \
  echo "  (pages may already be configured — continuing)"

URL="https://$OWNER.github.io/$REPO/"
echo ""
echo "✔ done."
echo ""
echo "  repo:  https://github.com/$OWNER/$REPO"
echo "  pages: $URL  (live in ~60s after the Actions run completes)"
echo ""
echo "  track the deploy here:"
echo "  https://github.com/$OWNER/$REPO/actions"
