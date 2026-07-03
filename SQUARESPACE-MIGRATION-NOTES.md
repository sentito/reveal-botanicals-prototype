# Squarespace Go-Live — Image Migration Notes

Last updated: July 3, 2026

## Comfrey (Collection → The Force Within)

**Status:** Needs attention before go-live.

On the Collection page, under **The Force Within**, most plant photos load from Carol Holland’s Adobe portfolio (`cdn.myportfolio.com` links). **Comfrey is the exception.**

| Plant | Image source |
|-------|----------------|
| Jack-In-the-Pulpit | Adobe portfolio URL |
| Western Skunk Cabbage | Adobe portfolio URL |
| **Comfrey** | **Embedded inside the prototype HTML** (`data:image/jpeg;base64,...` in `v13/index.html`) |

Comfrey was moved from the Sanctuary Garden section and kept the same embedded image data used there. It is **not** a separate image file in GitHub, and it does **not** have an Adobe portfolio link like the other Collection gallery images.

### Before moving to Squarespace

1. Locate the original Comfrey photo file (or export it from the prototype).
2. Upload it to Carol’s Adobe portfolio **or** directly into Squarespace’s image library.
3. Use that hosted URL when building the live Squarespace page — same workflow as Jack-In-the-Pulpit and Western Skunk Cabbage.

### Optional cleanup in this prototype

Once Comfrey is on Adobe portfolio, replace the long `data:image/jpeg;base64,...` string in `v13/index.html` (Force Within gallery block) with a `cdn.myportfolio.com` URL so all three Force Within images match.

### Code location

- Gallery data: `v13/index.html` → `collectionGalleryData['force-within']` → third image block (Comfrey)
- Popup data: `plantModalData['forcewithin-comfrey']`

This does **not** block the current GitHub Pages prototype. It is a migration checklist item so Comfrey is not overlooked when the site goes live on Squarespace.