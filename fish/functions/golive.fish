function golive
	clear;
git add .;
git commit -a -m "$argv";
git push origin master;
end
