#!/bin/bash
#SBATCH --job-name=vnc-singularity
#SBATCH --output=/home/sunyi000_gmail/vnc-%J.log
#SBATCH --time=04:00:00
#SBATCH --mem=8G
#SBATCH --cpus-per-task=4
#SBATCH --partition=batch

#module load singularity
#module load turbovnc  # or tigervnc

OUT=$(vncserver -geometry 1920x1080 -depth 24 -securitytypes none; sleep 36000000)
DISP=$(echo "$OUT" | sed -n "s/.*desktop is .*:\([0-9]\+\).*/\1/p") || true

if [ -z "$DISP" ]; then
  echo "$OUT"
  echo "Failed to detect VNC display" >&2
  exit 1
fi

export DISPLAY=:$DISP
PORT=$((5900 + DISP))

echo "Node: $(hostname)"
echo "DISPLAY=$DISPLAY  PORT=$PORT"
echo "SSH tunnel from your laptop:"
#echo "  ssh -L $PORT:$(hostname):$PORT $USER@cluster.domain"
echo "Then VNC viewer to: localhost:$PORT"

singularity exec \
  --bind /tmp/.X11-unix:/tmp/.X11-unix \
  --env DISPLAY=$DISPLAY \
  /vd-containers/napari-test \
  startxfce4 

# Cleanup
vncserver -kill $DISPLAY
