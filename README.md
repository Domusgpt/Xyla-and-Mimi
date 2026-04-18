# Xyla & Mimi

> A letter from Daddy, in particles and prose.

An interactive single-page experience built for the two people who rearranged my alphabet. Cinematic scroll with GSAP ScrollTrigger, a canvas particle heart that breathes with the page, a three-body orbit of us (Daddy / Mimi / Xyla) drawn in React, a scrubbed triceratops dream, animated counters, Web Audio ambient pad, and a typewritten vow at the end.

## Live

→ Once deployed, at: `https://<your-username>.github.io/Xyla-and-Mimi/`

## Run locally

No build step. Just:

```bash
python3 -m http.server 8000
# open http://localhost:8000
```

Or double-click `index.html`.

## What's inside

| File | Purpose |
|------|---------|
| `index.html` | Complete experience — HTML + CSS + JS + React in one file |
| `assets/` | 8 photos (compressed, max edge 1600px) |
| `.github/workflows/pages.yml` | Auto-deploys to GitHub Pages on push to `main` |
| `DEVLOG.md` | Build log with design tokens, systems, verification |
| `deploy.sh` | One-shot: init git, commit, create GH repo, push |

## Deploy

Assuming `gh` CLI authenticated:

```bash
./deploy.sh
```

That will create the repo, push, and enable Pages. Takes ~60 seconds before the URL is live.

## Design system (reusable)

Palette: **Midnight Nursery** — `#05060f` void, `#ffc66b` amber, `#ff7e6b` coral, `#f8ecd4` cream.  
Type: Fraunces (display) / Caveat (hand) / DM Sans (body).  
See `DEVLOG.md` for the full token table and "visual codex" candidate notes.

## License

MIT for the code. Photos belong to the family.

— Daddy · 2026
