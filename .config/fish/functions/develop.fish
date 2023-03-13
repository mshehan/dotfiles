function develop
	git co develop
	git fa
	git reset --hard origin/develop
	
	if test -e $argv 
		git co -b $argv
	end  
end 