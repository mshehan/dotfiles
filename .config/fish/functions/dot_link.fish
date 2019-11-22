function dot_link 
	mv $argv[1] ~/dotfiles
	ln -s ~/dotfiles/$argv[1] .
end 