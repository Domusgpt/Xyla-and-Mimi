# For Mimi & Xyla — Dev Log

## v1.0.0 — 2026-04-18

**Built by:** Claude Opus 4.7  
**Scope:** Single-file interactive love letter. No build step. Static-hostable.

### What's in the box
- `index.html` — full experience, ~2,000 lines, ~73 KB
- `assets/` — 8 compressed photos (~2.1 MB total, max edge 1600px, JPEG q85 progressive)
- `.github/workflows/pages.yml` — Actions workflow for Pages deploy
- `deploy.sh` — one-shot repo+Pages setup
- `LICENSE` · `README.md` · `.gitignore` · `.nojekyll`

### Systems
- **Particle-heart canvas** — 900 particles (520 mobile) on a parametric heart curve; seeded PRNG; mouse-repel; scroll-to-galaxy swirl; hue shift through palette
- **GSAP + ScrollTrigger orchestration** — word-by-word chapter title reveals (custom splitter handles `<em>` fragments), polaroid float-ins with 3D mouse-tilt, parallax image stacks, scrubbed cinematic dream reveal
- **SVG name morph** — "Mimi" → "Xyla" → "Mimi & Xyla" with coral-amber-cream gradient and ribbon path
- **React three-body orbit** — Daddy/Mimi/Xyla as gravitationally-interacting bodies (G=0.62, soft=120), draggable, three modes (figure-eight / cradle / free), ref-based reset, motion-blur trails
- **Stat counters** — six animated counters including ∞
- **Web Audio ambient pad** — generated C-maj9 chord with per-voice LFO detune shimmer + convolution reverb (2.4s impulse)
- **Custom cursor** with heart-spark trail (6-frame spawn throttle)
- **Triple-click easter egg** — 28-heart confetti shower within 800ms window
- **Typewriter finale** — three-line vow with human-jittered timing (28-58ms/char) + signature fade
- **Grain overlay** (pre-rendered 256×256 tile, animated offset) · vignette · loader with 4.2s safety timeout

### Design tokens (candidate for visual codex)
| Token | Value |
|---|---|
| `--void` | `#05060f` |
| `--night` | `#0a0c1f` |
| `--navy` | `#141736` |
| `--deep-plum` | `#2a1f3d` |
| `--amber` | `#f3b74d` |
| `--amber-hot` | `#ffc66b` |
| `--coral` | `#ff7e6b` |
| `--rose` | `#ffb3a7` |
| `--cream` | `#f8ecd4` |
| `--sage` | `#a8c8a1` |

Type stack: **Fraunces** (display) / **Caveat** (hand) / **DM Sans** (body).  
Easings: `--ease-silk cubic-bezier(.23,1,.32,1)` · `--ease-swell cubic-bezier(.65,0,.35,1)` · `--ease-breath cubic-bezier(.37,0,.63,1)`.

**Visual codex recommendation:** Promote the "Midnight Nursery" palette + Fraunces/Caveat pairing as a reusable **intimate-editorial** theme. Useful for personal narratives, memoirs, private site landing pages, long-form storytelling.

### Red team / verification
- **0 JS errors** in headless Chromium (1440×900 + mobile 390×844)
- Node `--check` passed on all 6 vanilla scripts
- `@babel/core` transform passed on JSX island
- Visual spot-checks at 10 scroll positions rendered correctly (desktop + mobile)
- Tag/brace balance verified

### Dependencies (all CDN, no build step)
- GSAP 3.12.5 + ScrollTrigger (cdnjs)
- React 18.3.1 + ReactDOM 18.3.1 (cdnjs)
- Babel Standalone 7.24.7 (cdnjs)
- Google Fonts: Fraunces, Caveat, DM Sans

### Licensing / middleware / telemetry
- **Code**: MIT (see `LICENSE`)
- **Photography**: private, all rights reserved to the family
- **No telemetry** is shipped. For a production agent-focused product, next iteration should add a privacy-respecting page-view counter (e.g. GoatCounter or self-hosted Umami), an Open Graph card for social shares, and a Sentry-style error reporter gated on explicit opt-in.
- **Accessibility**: respects `prefers-reduced-motion`; semantic section structure; all images have `alt`; keyboard-focusable buttons.

### Known-good browsers
Chrome / Safari / Firefox / Edge — 2023 and newer.

### Deferred / next session candidates
- Preload critical fonts; ship WebP alongside JPEG
- Add SEO + OG meta + favicon set
- Add Sentry-like opt-in error reporter
- Publish a small design-token JSON for reuse in other projects
- Port orbit simulation to WebGL (GPU) if particle count needs to scale

## v1.0.1 — 2026-04-18 (hotfix)

**Bug**: Dream section ("when you are older, we'll ride into any century") rendered as empty blackness mid-scroll — title and background invisible.

**Root cause**: `overflow-x: hidden` on `body` silently broke `position: sticky` on `.dream-sticky` in Chromium (known engine quirk — overflow creates an unexpected containing block that prevents sticky from engaging). The scrub animations were running correctly (verified via opacity trace at 40/55/70% scroll), but the pinned content had scrolled off-screen because nothing was actually pinning it.

**Fix**:
1. `overflow-x: hidden` → `overflow-x: clip` on html/body (same visual clipping, no scroll-container side-effect).
2. Swapped CSS `position: sticky` on `.dream-sticky` for GSAP ScrollTrigger `pin: '.dream-sticky'` with `pinSpacing: true, anticipatePin: 1`. Robust across Chromium / WebKit / Firefox.
3. `.dream` section shortened from `min-height: 200vh` to `100vh` since GSAP now handles the pin-spacing math.

**Verified**: Opacity trace at 0/30/60/90/110% of scrub range — bg filter animates brightness/blur, 12 title words fade in with 0.035s stagger, body fades in at t≈0.55, sticky holds at viewport top 0→900 throughout. Screenshot at 90% confirms full triceratops image with overlaid text.

## v1.0.2 — 2026-04-18 (content re-frame)

**Context change**: Family doesn't share a single home day-to-day. Reframed all copy that assumed cohabitation/daily domestic presence toward "love-across-distance" without losing emotional weight.

**Edits:**
- Xyla intro: "find your face again each morning" → "keep your face close, even on the days I don't get to see it"
- Polaroid caption: "those eyes, every day" → "those eyes I know by heart"
- Mimi note iv: "ordinary Tuesday worth framing" → "small wonders you keep, and send, and save — the ones I carry with me until the next time I see you"
- Stat: "small rescues per year / knee scrapes · nightmares · lost toys" → "ways I'd come running / a scraped knee · a bad dream · any reason at all" (readiness framing, not daily-proximity framing)
- Stat: "heartbeats in this house / forever synchronized" → "hearts pulling toward each other / across any distance · always"
- Orbit intro: Leaned into "Distance doesn't weaken gravity" — the three-body metaphor now carries conceptual weight for the family configuration
- Vow line 1: "If love is a place — this is where we live" → "If love is a place — it's the one I carry, not the one with a door"
- Signature sub: "written under a small lamp · long after you both fell asleep" → "written under a small lamp · wherever I am · thinking of you both"

**Verified**: grep'd for remaining cohabitation-implying phrases (`each morning`, `in this house`, `ordinary Tuesday`, `fell asleep`, `where we live`, `rescues per year`) — all clean. Rendered mimi/numbers/finale sections in headless Chromium, 0 JS errors.
