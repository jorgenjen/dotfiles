from libqtile import bar, widget
from spotify import Spotify


APPLICATION_NAME_SUB = {
    "Firefox": "Firefox",
    "Google Chrome": "Chrome",
    "Code - OSS": "VScode",
    "~": "Alacritty",
    "nvim": "Neovim",
    "None": "",
    "DesktopEditors": "OnlyOffice",
    "Microsoft Teams": "Microsoft Teams",
}


def replace_window_title(text):
    for key in APPLICATION_NAME_SUB.keys():
        if key in text:
            return APPLICATION_NAME_SUB[key]
    return text




def init_bar():
    return bar.Bar(
            [
                widget.Spacer(
                    length=20,
                    background='#1F1D2E',
                ),
				

                widget.Image(
                    filename='~/.config/qtile/Assets/launch_Icon.png',
                    margin=2,
                    background='#1F1D2E',
                ),

                widget.Image(
                    filename='~/.config/qtile/Assets/6.png',
                ),

                widget.Spacer(
                    length=10,
                    background='#4B427E',
                ),

                widget.GroupBox(
                    fontsize=20,
                    borderwidth=4,
                    highlight_method='block',
                    active='#BD85CB',
                    block_highlight_text_color="#CFB3E5",
                    highlight_color='#4B427E',
                    inactive='#7F61A7',
                    foreground='#4B427E',
                    background='#4B427E',
                    this_current_screen_border='#52548D',
                    this_screen_border='#52548D',
                    other_current_screen_border='#52548D',
                    other_screen_border='#52548D',
                    urgent_border='#52548D',
                    rounded=True,
                    disable_drag=True,
                ),

                widget.Image(
                    filename='~/.config/qtile/Assets/5.png',
                ),

                widget.CurrentLayoutIcon(
                    background='#52548D',
                    padding = 0,
                    scale = 0.6,
                ),

                    widget.CurrentLayout(
                    background='#52548D',
                    font= 'JetBrains Mono Bold',
                ),

                

                widget.Image(
                    filename='~/.config/qtile/Assets/4.png',                
                ),

                # widget.WindowName(
                #     background = '#7676B2',
                #     format = "{name}",
                #     font='JetBrains Mono Bold',
                #     empty_group_string = 'Desktop',
                # ),

                widget.WindowName(
                    format=" {name}",
                    background="#7676B2",
                    font="JetBrains Mono Bold",
                    # max_chars=25,
                    parse_text=replace_window_title,
                ),

                
                widget.Image(
                    filename='~/.config/qtile/Assets/3.png',                
                ),   

                Spotify(
                    format="{icon}   {track}  \ueb8a  {artist}", 
                    play_icon = "\uf001",
                    pause_icon = "\uf04c",
                    background="#52548D"
                ),

                widget.Spacer(
                    length=15,
                    background='#52548D',
                ),
               

                # widget.Systray(
                #     background='#52548D',
                #     fontsize=2,
                # ),

                # widget.TextBox(
                #     text=' ',
                #     background='#52548D',
                # ),


                widget.Image(
                    filename='~/.config/qtile/Assets/2.png',                
                    background='#52548D',
                ),                       
                                                
                # widget.TextBox(
                #     text='',
                #     size=20,
                #     font='JetBrains Mono Bold',
                #     background='#4B427E',
                # ),
                                
                # widget.Battery(format=' {percent:2.0%}',
                #     font="JetBrains Mono ExtraBold",
                #     fontsize=12,
                #     padding=10,
                #     background='#4B427E',
                # ),                     
                 
                 widget.TextBox(
                    text='﬙',
                    fontsize=18,
                    font='JetBrains Mono Bold',
                    background='#4B427E',
                ),

                widget.Memory(format='{MemUsed: .0f}{mm}',
                    font="JetBrains Mono Bold",
                    fontsize=12,
                    #padding=10,
                    background='#4B427E',
                ),

                widget.Spacer(
                    length=10,
                    background='#4B427E',
                ),

                widget.TextBox(
                    text="",
                    font="Font Awesome 6 Free Solid",
                    fontsize=15,
                    padding=5,
                    background='#4B427E',
                ),
                
                widget.PulseVolume(font='JetBrains Mono Bold',
                    fontsize=12,
                    padding=10,
                    background='#4B427E',
                ),     
                widget.Spacer(
                    length=6,
                    background='#4B427E',
                ),           


                widget.Image(
                    filename='~/.config/qtile/Assets/1.png',                
                    background='#4B427E',
                ),
        
              
                    
                widget.Clock(
                    format=' %H:%M',
                    fontsize = 13,
                    background='#1F1D2E',
                    font="JetBrains Mono Bold",
                ),

                widget.Spacer(
                    length=22,
                    background='#1F1D2E',
                ),

            ],
            30,
            margin = [8,8,4,8]
        )