function xim
	if test -e $argv
		open -a "Visual Studio Code.app" $argv
	else 
		touch $argv
		open -a "Visual Studio Code.app" $argv
	end
end 