#!/bin/bash
# pyglotaran starter kit - macOS launcher
# Double-click this file to set everything up and start the analysis
# environment. If macOS refuses to open it, right-click (or Ctrl-click)
# the file and choose "Open" - see READ_ME_FIRST.html for details.

cd "$(dirname "$0")" || exit 1

fail() {
    echo
    echo "  $1"
    echo
    echo "  You can close this window now."
    echo "  Running the script again will resume where it left off."
    read -r -p "  Press Enter to close ... "
    exit 1
}

echo
echo " ============================================================"
echo "  pyglotaran starter kit"
echo " ============================================================"
echo
echo "  This window sets everything up and then opens the analysis"
echo "  environment in your web browser."
echo
echo "  The FIRST time this runs it downloads Python and the"
echo "  analysis packages (roughly 500 MB), which can take a few"
echo "  minutes. After that, starting is quick and works offline."
echo
echo "  KEEP THIS TERMINAL WINDOW OPEN while you work."
echo

export PATH="$HOME/.local/bin:$PATH"

if ! command -v uv >/dev/null 2>&1; then
    echo "  Step 1/3: Installing the 'uv' Python manager ..."
    echo
    curl -LsSf https://astral.sh/uv/install.sh | sh \
        || fail "Could not install 'uv'. Are you connected to the internet?"
    export PATH="$HOME/.local/bin:$PATH"
else
    echo "  Step 1/3: The 'uv' Python manager is already installed."
fi

command -v uv >/dev/null 2>&1 \
    || fail "'uv' was installed but could not be found. Please close this window and try again."

echo
echo "  Step 2/3: Setting up Python and the analysis packages ..."
echo "            (first run only: this downloads about 500 MB)"
echo
uv sync || fail "Setup failed. Check your internet connection and free disk space (about 2 GB is needed)."

echo
echo "  Step 3/3: Opening the analysis environment in your browser ..."
echo
echo "  When you are done: save your notebook in the browser, then"
echo "  close the browser tab and close this window."
echo
uv run jupyter lab 01_welcome.ipynb

echo
read -r -p "  Analysis environment stopped. Press Enter to close ... "
