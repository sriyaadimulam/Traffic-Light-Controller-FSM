from vcdvcd import VCDVCD
import tkinter as tk
import time
import os

# =========================================================
# LOAD VCD FILE
# =========================================================

vcd = VCDVCD("visualization/traffic.vcd")

# =========================================================
# TKINTER WINDOW
# =========================================================

root = tk.Tk()

root.title("Traffic Light FSM Visualizer")
root.geometry("800x500")
root.configure(bg="#0f1117")

title = tk.Label(
    root,
    text="Traffic Light Controller using FSM",
    bg="#0f1117",
    fg="white",
    font=("Arial", 22, "bold")
)

title.pack(pady=20)

# =========================================================
# CANVAS
# =========================================================

canvas = tk.Canvas(
    root,
    width=800,
    height=400,
    bg="#0f1117",
    highlightthickness=0
)

canvas.pack()

# =========================================================
# ROAD LABELS
# =========================================================

canvas.create_text(
    220,
    40,
    text="Road A",
    fill="white",
    font=("Arial", 18, "bold")
)

canvas.create_text(
    580,
    40,
    text="Road B",
    fill="white",
    font=("Arial", 18, "bold")
)

# =========================================================
# TRAFFIC LIGHTS
# =========================================================

# Road A
A_red = canvas.create_oval(170, 70, 270, 170, fill="gray")
A_yellow = canvas.create_oval(170, 190, 270, 290, fill="gray")
A_green = canvas.create_oval(170, 310, 270, 410, fill="gray")

# Road B
B_red = canvas.create_oval(530, 70, 630, 170, fill="gray")
B_yellow = canvas.create_oval(530, 190, 630, 290, fill="gray")
B_green = canvas.create_oval(530, 310, 630, 410, fill="gray")

# =========================================================
# HELPER FUNCTION
# =========================================================

def set_light(light, color, state):

    if state == "1":
        canvas.itemconfig(light, fill=color)
    else:
        canvas.itemconfig(light, fill="gray")

# =========================================================
# FSM STATES
# =========================================================

states = [

    # S0
    ("0", "0", "1", "1", "0", "0"),

    # S1
    ("0", "1", "0", "1", "0", "0"),

    # S2
    ("1", "0", "0", "0", "0", "1"),

    # S3
    ("1", "0", "0", "0", "1", "0")

]

# =========================================================
# MAIN LOOP
# =========================================================

while True:

    for state in states:

        A_R_state, A_Y_state, A_G_state, \
        B_R_state, B_Y_state, B_G_state = state

        # Road A
        set_light(A_red, "red", A_R_state)
        set_light(A_yellow, "yellow", A_Y_state)
        set_light(A_green, "lime", A_G_state)

        # Road B
        set_light(B_red, "red", B_R_state)
        set_light(B_yellow, "yellow", B_Y_state)
        set_light(B_green, "lime", B_G_state)

        root.update()

        time.sleep(2)

root.mainloop()