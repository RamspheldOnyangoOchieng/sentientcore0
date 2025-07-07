@echo off
REM Sentient Core Setup Script

echo =======================================
echo [1/5] Checking Python...
where python
IF %ERRORLEVEL% NEQ 0 (
    echo Python not found. Please install Python 3.10+ and add it to your PATH.
    exit /b 1
)

echo [2/5] Installing Python dependencies...
cd sentient-core
python -m pip install --upgrade pip
python -m pip install -r requirements.txt
cd ..

echo [3/5] Checking Node.js...
where node
IF %ERRORLEVEL% NEQ 0 (
    echo Node.js not found. Please install Node.js and add it to your PATH.
    exit /b 1
)

echo [4/5] Installing frontend dependencies...
cd sentient-core/frontend
npm install
cd ../..

echo [5/5] Setup complete!

echo Starting backend server in a new window...
start cmd /k "cd /d %cd%\sentient-core\app && python main.py"

echo Starting frontend server in a new window...
start cmd /k "cd /d %cd%\sentient-core\frontend && npm run dev"

echo Both backend and frontend servers are starting.
pause
