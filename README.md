# [CrossCode](https://cross-code.com)-inspired Plymouth theme

Recording of the boot process with [crossgrub](https://github.com/krypciak/crossgrub) grub theme installed and LUKS2+LVM setup: 

https://github.com/user-attachments/assets/1531b56d-1a2f-4b32-86ec-822f85bf2744

The theme consists of:
- Boot progress bar
- Disk decryption password input menu
- Shutdown/reboot screen

NOTE: The wallpaper shown in the recording is not part of the theme, you can find it [here](https://github.com/krypciak/dotfiles/blob/main/user/.config/wallpapers/crosscode-circuits.png)

## Installation

NOTE: Instructions for Arch Linux  

### initramfs flags

Add `plymouth` to `HOOKS` after `udev`:  
`/etc/mkinitcpio.conf`:  
```
HOOKS=(base udev plymouth keyboard ...)
```

Remember to regenerate initramfs:
```bash
mkinitcpio -P
```

### Kernel parameters

You have to add the `quiet splash` parameters, the other flags are recommended for a more flicker-free experience.  
For example with GRUB:  
`/etc/default/grub`:  
```
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash vt.global_cursor_default=0 loglevel=3 systemd.show_status=0 rd.udev.log_level=3 fbcon=nodefer"
```

Remember to regenerate GRUB config:
```bash
grub-mkconfig -o /boot/grub/grub.cfg
```

### Theme installation - from source

- Clone the repository
```bash
git clone https://github.com/krypciak/crosscode-plymouth
```

- Run the installation script as root
```bash
sudo bash ./install.sh
```

- Done!

- If you want, you can preview the theme (works only on X11; does not work through XWayland):
```
sudo bash ./preview.sh
```

# Screenshots

<img width="1920" height="1080" alt="boot progress bar" src="https://github.com/user-attachments/assets/2a729aa9-a52e-462f-a566-ff4100e8ef41" />
<img width="1920" height="1080" alt="password menu" src="https://github.com/user-attachments/assets/451e0883-6ac0-4044-b71b-65ddf04be1e5" />
<img width="1920" height="1080" alt="shutdown screen" src="https://github.com/user-attachments/assets/f86b3595-da59-416f-bb57-6d245d5d6e15" />

