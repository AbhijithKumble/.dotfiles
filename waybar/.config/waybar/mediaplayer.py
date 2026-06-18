#!/usr/bin/env python3
import sys
import json
import subprocess
import html

def get_player_status():
    try:
        player = subprocess.check_output(
            ['playerctl', '-l'], 
            text=True
        ).strip().split('\n')[0]
        
        status = subprocess.check_output(
            ['playerctl', '-p', player, 'status'], 
            text=True
        ).strip()
        
        artist = subprocess.check_output(
            ['playerctl', '-p', player, 'metadata', 'artist'], 
            text=True
        ).strip()
        
        title = subprocess.check_output(
            ['playerctl', '-p', player, 'metadata', 'title'], 
            text=True
        ).strip()
        
        text = f"{artist} - {title}" if artist else title
        text = html.escape(text)  # Escape special characters
        
        output = {
            "text": text,
            "class": status.lower()
        }
        
        print(json.dumps(output))
        
    except:
        print(json.dumps({"text": ""}))

if __name__ == "__main__":
    get_player_status()
