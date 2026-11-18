# Tools-only dev shell for ComfyUI on macOS/Linux.
# Nix provides tooling; Python and all wheels are managed by uv in ./.venv.
# On entry: create .venv if missing, and re-sync packages when the
# requirements files change (tracked by a hash stamp in .venv).
{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell {
  packages = with pkgs; [ uv git ffmpeg pkg-config ];

  # Use uv-managed CPython (python-build-standalone), never Nix's Python.
  UV_PYTHON_PREFERENCE = "only-managed";

  shellHook = ''
    if [ ! -x .venv/bin/python ]; then
      echo "[shell.nix] creating .venv (Python 3.13)"
      uv venv --python 3.13 .venv || return 1
    fi

    req_hash=$(cat requirements.txt manager_requirements.txt 2>/dev/null | shasum -a 256 | cut -d' ' -f1)
    stamp=.venv/.requirements.sha256
    if [ "$(cat "$stamp" 2>/dev/null)" != "$req_hash" ]; then
      echo "[shell.nix] requirements changed; syncing packages into .venv"
      if uv pip install --python .venv/bin/python \
           -r requirements.txt -r manager_requirements.txt; then
        echo "$req_hash" > "$stamp"
      else
        echo "[shell.nix] uv pip install failed; .venv left as-is" >&2
      fi
    fi

    export VIRTUAL_ENV="$PWD/.venv"
    export PATH="$VIRTUAL_ENV/bin:$PATH"

    alias comfyui='python main.py --listen 127.0.0.1 --port 8188'
  '';
}
