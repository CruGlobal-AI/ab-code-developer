# AGENTS.md

Builds `ghcr.io/cruglobal-ai/ab-code-developer`: a tarball of every AppBuilder service repo, used by `appbuilder install --develop` to fill `developer/`.

- CruGlobal-AI fork of `digi-serve/ab-code-developer`.
- `buildContainer.js` clones from `AB_GITHUB_ORG` (default `CruGlobal-AI`). The Dockerfile takes it as a build arg, and CI passes the repo owner.
- Base image: `ghcr.io/cruglobal-ai/service-cli` (from `CruGlobal-AI/service-cli`).
- CI (`update-docker-image.yml`) pushes to GHCR on push to `master`, weekly, or by hand.
- Check: `node --check buildContainer.js`.
