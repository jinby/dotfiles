mkdir -p ~/.local/share/fonts
#cd ~/.local/share/fonts && curl -fLO https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/FiraMono/Regular/FiraMonoNerdFont-Regular.otf
#cd ~/.local/share/fonts && curl -fLO https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/FiraCode/Regular/FiraCodeNerdFont-Regular.ttf

cp ./FiraMonoNerdFont-Regular.otf ~/.local/share/fonts/
cp ./FiraCodeNerdFont-Regular.ttf ~/.local/share/fonts/
sudo cp ./FiraMonoNerdFont-Regular.otf /usr/local/share/fonts/
sudo cp ./FiraCodeNerdFont-Regular.ttf /usr/local/share/fonts/
sudo cd ~/.local/share/fonts

mkfontscale # 生成核心字体信息
mkfontdir # 生成字体文件夹
fc-cache -fv # 刷新系统字体缓存
