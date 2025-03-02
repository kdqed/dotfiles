cp /etc/nixos/configuration.nix configuration.nix
cp $HOME/.bashrc bashrc

rm -rf icons
cp -r $HOME/.icons icons

rm -rf config
mkdir config
cp -r $HOME/.config/gtk-3.0 config/gtk-3.0
cp -r $HOME/.config/gtk-4.0 config/gtk-4.0
cp -r $HOME/.config/hypr config/hypr
cp -r $HOME/.config/kitty config/kitty
cp -r $HOME/.config/lite-xl config/lite-xl
cp -r $HOME/.config/micro config/micro
cp -r $HOME/.config/yambar config/yambar
cp -r $HOME/.config/yazi config/yazi

$HOME/.venv/bin/pip freeze > python-packages.txt


