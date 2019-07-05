clear
echo 'Hubungi : 08126914207'
echo 'Untuk meminta username dan password'
sleep 3
clear
python2 log.py
figlet -f slant "sw4llow" |lolcat
trap 'printf "
";partial;exit 1' 2
banner() {
printf "\e[1;77m | | | |___  ___ ___  \e[0m\e[1;92m// \      / \ \e[0m
"
printf "\e[1;77m | | | / __|/ _ \ '_ \e[0m\e[1;92m|\__\    /__/| \e[0m
"
printf "\e[1;77m | |_| \__ \  __/ |   \e[0m\e[1;92m\    ||    / \e[0m
"
printf "\e[1;77m  \___/|___/\___|_|    \e[0m\e[1;92m\        / \e[0m
"
printf "       \e[1;92mv1.0, Author: xnSW4llOW"
}
partial() {
if [[ -e $username.txt ]]; then
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Saved:\e[0m\e[1;77m %s.txt
" $username
fi
}
scanner() {
echo""
echo""
read -p $'Masukan Nama Korban:\e[0m ' username
sleep 2
clear
echo "Mencari Korban Ini Akan Berlangsung Lama..."
sleep 3
clear
if [[ -e $username.txt ]]; then
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Removing previous file:\e[0m\e[1;77m %s.txt" $username
rm -rf $username.txt
fi
printf "
"
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Checking username\e[0m\e[1;77m %s\e[0m\e[1;92m on: \e[0m
" $username
check_insta=$(curl -s -H "Accept-Language: en" "https://www.instagram.com/$username" -L | grep -o 'The link you followed may be broken'; echo $?)
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Instagram: \e[0m"
if [[ $check_insta == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://www.instagram.com/%s
" $username
printf "https://www.instagram.com/%s
" $username > $username.txt
elif [[ $check_insta == *'0'* ]]; then
printf "\e[1;93mNot Found!\e[0m
"
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Facebook: \e[0m"
check_face=$(curl -s "https://www.facebook.com/$username" -L -H "Accept-Language: en" | grep -o 'not found'; echo $?)
if [[ $check_face == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://www.facebook.com/%s
" $username
printf "https://www.facebook.com/%s
" $username >> $username.txt
elif [[ $check_face == *'0'* ]]; then
printf "\e[1;93mNot Found!\e[0m
"
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Twitter: \e[0m"
check_twitter=$(curl -s "https://www.twitter.com/$username" -L -H "Accept-Language: en" | grep -o 'page doesn’t exist'; echo $?)
if [[ $check_twitter == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://www.twitter.com/%s
" $username
printf "https://www.twitter.com/%s
" $username >> $username.txt
elif [[ $check_twitter == *'0'* ]]; then
printf "\e[1;93mNot Found!\e[0m
"
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] YouTube: \e[0m"
check_youtube=$(curl -s "https://www.youtube.com/$username" -L -H "Accept-Language: en" | grep -o 'Not Found'; echo $?)
if [[ $check_youtube == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://www.youtube.com/%s
" $username
printf "https://www.youtube.com/%s
" $username >> $username.txt
elif [[ $check_youtube == *'0'* ]]; then
printf "\e[1;93mNot Found!\e[0m
"
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Blogger: \e[0m"
check=$(curl -s "https://$username.blogspot.com" -L -H "Accept-Language: en" -i | grep -o 'HTTP/2 404'; echo $?)
if [[ $check == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://%s.blogspot.com
" $username
printf "https://%s.blogspot.com
" $username >> $username.txt
elif [[ $check == *'0'* ]]; then
printf "\e[1;93mNot Found!\e[0m
"
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] GooglePlus: \e[0m"
check=$(curl -s "https://plus.google.com/+$username/posts" -L -H "Accept-Language: en" -i | grep -o 'HTTP/2 404' ; echo $?)
if [[ $check == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://plus.google.com/+%s/posts
" $username
printf "https://plus.google.com/+%s/posts
" $username >> $username
elif [[ $check == *'0'* ]]; then
printf "\e[1;93mNot Found!\e[0m
"
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Reddit: \e[0m"
check1=$(curl -s -i "https://www.reddit.com/user/$username" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | head -n1 | grep -o 'HTTP/2 404' ; echo $?)
if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m
"
elif [[ $check1 == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://www.reddit.com/user/%s
" $username
printf "https://www.reddit.com/user/%s
" $username >> $username.txt
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Wordpress: \e[0m"
check1=$(curl -s -i "https://$username.wordpress.com" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o 'Do you want to register' ; echo $?)
if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m
"
elif [[ $check1 == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://%s.wordpress.com
" $username
printf "https://%s.wordpress.com
" $username >> $username.txt
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Pinterest: \e[0m"
check1=$(curl -s -i "https://www.pinterest.com/$username" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o '?show_error' ; echo $?)
if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m
"
elif [[ $check1 == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://www.pinterest.com/%s
" $username
printf "https://www.pinterest.com/%s
" $username >> $username.txt
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Github: \e[0m"
check1=$(curl -s -i "https://www.github.com/$username" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o '404 Not Found' ; echo $?)
if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m
"
elif [[ $check1 == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://www.github.com/%s
" $username
printf "https://www.github.com/%s
" $username >> $username.txt
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Tumblr: \e[0m"
check1=$(curl -s -i "https://$username.tumblr.com" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o 'HTTP/2 404' ; echo $?)
if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m
"
elif [[ $check1 == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://%s.tumblr.com
" $username
printf "https://%s.tumblr.com
" $username >> $username.txt
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Flickr: \e[0m"
check1=$(curl -s -i "https://www.flickr.com/people/$username" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o 'Not Found' ; echo $?)
if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m
"
elif [[ $check1 == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://www.flickr.com/photos/%s
" $username
printf "https://www.flickr.com/photos/%s
" $username >> $username.txt
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Steam: \e[0m"
check1=$(curl -s -i "https://steamcommunity.com/id/$username" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o 'The specified profile could not be found' ; echo $?)
if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m
"
elif [[ $check1 == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://steamcommunity.com/id/%s
" $username
printf "https://steamcommunity.com/id/%s
" $username >> $username.txt
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Vimeo: \e[0m"
check1=$(curl -s -i "https://vimeo.com/$username" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o '404 Not Found' ; echo $?)
if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m
"
elif [[ $check1 == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://vimeo.com/%s
" $username
printf "https://vimeo.com/%s
" $username >> $username.txt
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] SoundCloud: \e[0m"
check1=$(curl -s -i "https://soundcloud.com/$username" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o '404 Not Found'; echo $?)
if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m
"
elif [[ $check1 == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://soundcloud.com/%s
" $username
printf "https://soundcloud.com/%s
" $username >> $username.txt
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Disqus: \e[0m"
check1=$(curl -s -i "https://disqus.com/$username" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o '404 NOT FOUND' ; echo $?)
if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m
"
elif [[ $check1 == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://disqus.com/%s
" $username
printf "https://disqus.com/%s
" $username >> $username.txt
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Medium: \e[0m"
check1=$(curl -s -i "https://medium.com/@$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)
if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m
"
elif [[ $check1 == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://medium.com/@%s
" $username
printf "https://medium.com/@%s
" $username >> $username.txt
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] DeviantART: \e[0m"
check1=$(curl -s -i "https://$username.deviantart.com" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)
if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m
"
elif [[ $check1 == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://%s.deviantart.com
" $username
printf "https://%s.deviantart.com
" $username >> $username.txt
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] VK: \e[0m"
check1=$(curl -s -i "https://vk.com/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)
if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m
"
elif [[ $check1 == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://vk.com/%s
" $username
printf "https://vk.com/%s
" $username >> $username.txt
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] About.me: \e[0m"
check1=$(curl -s -i "https://about.me/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)
if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m
"
elif [[ $check1 == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://about.me/%s
" $username
printf "https://about.me/%s
" $username >> $username.txt
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Imgur: \e[0m"
check1=$(curl -s -i "https://imgur.com/user/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)
if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m
"
elif [[ $check1 == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://imgur.com/user/%s
" $username
printf "https://imgur.com/user/%s
" $username >> $username.txt
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Flipboard: \e[0m"
check1=$(curl -s -i "https://flipboard.com/@$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)
if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m
"
elif [[ $check1 == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://flipboard.com/@%s
" $username
printf "https://flipboard.com/@%s
" $username >> $username.txt
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] SlideShare: \e[0m"
check1=$(curl -s -i "https://slideshare.net/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)
if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m
"
elif [[ $check1 == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://slideshare.net/%s
" $username
printf "https://slideshare.net/%s
" $username >> $username.txt
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Fotolog: \e[0m"
check1=$(curl -s -i "https://fotolog.com/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)
if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m
"
elif [[ $check1 == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://fotolog.com/%s
" $username
printf "https://fotolog.com/%s
" $username >> $username.txt
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Spotify: \e[0m"
check1=$(curl -s -i "https://open.spotify.com/user/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)
if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m
"
elif [[ $check1 == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://open.spotify.com/user/%s
" $username
printf "https://open.spotify.com/user/%s
" $username >> $username.txt
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] MixCloud: \e[0m"
check1=$(curl -s -i "https://www.mixcloud.com/$username" -H "Accept-Language: en" -L | grep -o 'error-message' ; echo $?)
if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m
"
elif [[ $check1 == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://www.mixcloud.com/%s
" $username
printf "https://www.mixcloud.com/%s
" $username >> $username.txt
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Scribd: \e[0m"
check1=$(curl -s -i "https://www.scribd.com/$username" -H "Accept-Language: en" -L | grep -o 'show_404' ; echo $?)
if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m
"
elif [[ $check1 == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://www.scribd.com/%s
" $username
printf "https://www.scribd.com/%s
" $username >> $username.txt
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Badoo: \e[0m"
check1=$(curl -s -i "https://www.badoo.com/en/$username" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)
if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m
"
elif [[ $check1 == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://www.badoo.com/en/%s
" $username
printf "https://www.badoo.com/en/%s
" $username >> $username.txt
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Patreon: \e[0m"
check1=$(curl -s -i "https://www.patreon.com/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)
if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m
"
elif [[ $check1 == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://www.patreon.com/%s
" $username
printf "https://www.patreon.com/%s
" $username >> $username.txt
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] BitBucket: \e[0m"
check1=$(curl -s -i "https://bitbucket.org/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)
if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m
"
elif [[ $check1 == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://bitbucket.org/%s
" $username
printf "https://bitbucket.org/%s
" $username >> $username.txt
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] DailyMotion: \e[0m"
check1=$(curl -s -i "https://www.dailymotion.com/$username" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)
if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m
"
elif [[ $check1 == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://www.dailymotion.com/%s
" $username
printf "https://www.dailymotion.com/%s
" $username >> $username.txt
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Etsy: \e[0m"
check1=$(curl -s -i "https://www.etsy.com/shop/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)
if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m
"
elif [[ $check1 == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://www.etsy.com/shop/%s
" $username
printf "https://www.etsy.com/shop/%s
" $username >> $username.txt
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] CashMe: \e[0m"
check1=$(curl -s -i "https://cash.me/$username" -H "Accept-Language: en" -L | grep -o '404 Not Found'; echo $?)
if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m
"
elif [[ $check1 == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://cash.me/%s
" $username
printf "https://cash.me/%s
" $username >> $username.txt
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Behance: \e[0m"
check1=$(curl -s -i "https://www.behance.net/$username" -H "Accept-Language: en" -L | grep -o '404 Not Found'; echo $?)
if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m
"
elif [[ $check1 == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://www.behance.net/%s
" $username
printf "https://www.behance.net/%s
" $username >> $username.txt
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] GoodReads: \e[0m"
check1=$(curl -s -i "https://www.goodreads.com/$username" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)
if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m
"
elif [[ $check1 == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://www.goodreads.com/%s
" $username
printf "https://www.goodreads.com/%s
" $username >> $username.txt
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Instructables: \e[0m"
check1=$(curl -s -i "https://www.instructables.com/member/$username" -H "Accept-Language: en" -L | grep -o '404 NOT FOUND' ; echo $?)
if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m
"
elif [[ $check1 == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://www.instructables.com/member/%s
" $username
printf "https://www.instructables.com/member/%s
" $username >> $username.txt
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Keybase: \e[0m"
check1=$(curl -s -i "https://keybase.io/$username" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)
if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m
"
elif [[ $check1 == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://keybase.io/%s
" $username
printf "https://keybase.io/%s
" $username >> $username.txt
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Kongregate: \e[0m"
check1=$(curl -s -i "https://kongregate.com/accounts/$username" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)
if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m
"
elif [[ $check1 == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://kongregate.com/accounts/%s
" $username
printf "https://kongregate.com/accounts/%s
" $username >> $username.txt
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] LiveJournal: \e[0m"
check1=$(curl -s -i "https://$username.livejournal.com" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)
if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m
"
elif [[ $check1 == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://%s.livejournal.com
" $username
printf "https://%s.livejournal.com
" $username >> $username.txt
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] AngelList: \e[0m"
check1=$(curl -s -i "https://angel.co/$username" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)
if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m
"
elif [[ $check1 == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://angel.co/%s
" $username
printf "https://angel.co/%s
" $username >> $username.txt
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] last.fm: \e[0m"
check1=$(curl -s -i "https://last.fm/user/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)
if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m
"
elif [[ $check1 == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://last.fm/user/%s
" $username
printf "https://last.fm/user/%s
" $username >> $username.txt
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Dribbble: \e[0m"
check1=$(curl -s -i "https://dribbble.com/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)
if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m
"
elif [[ $check1 == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://dribbble.com/%s
" $username
printf "https://dribbble.com/%s
" $username >> $username.txt
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Codecademy: \e[0m"
check1=$(curl -s -i "https://www.codecademy.com/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)
if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m
"
elif [[ $check1 == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://www.codecademy.com/%s
" $username
printf "https://www.codecademy.com/%s
" $username >> $username.txt
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Gravatar: \e[0m"
check1=$(curl -s -i "https://en.gravatar.com/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)
if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m
"
elif [[ $check1 == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://en.gravatar.com/%s
" $username
printf "https://en.gravatar.com/%s
" $username >> $username.txt
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Pastebin: \e[0m"
check1=$(curl -s -i "https://pastebin.com/u/$username" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o 'location: /index' ; echo $?)
if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m
"
elif [[ $check1 == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://pastebin.com/u/%s
" $username
printf "https://pastebin.com/u/%s
" $username >> $username.txt
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Foursquare: \e[0m"
check1=$(curl -s -i "https://foursquare.com/$username" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)
if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m
"
elif [[ $check1 == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://foursquare.com/%s
" $username
printf "https://foursquare.com/%s
" $username >> $username.txt
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Roblox: \e[0m"
check1=$(curl -s -i "https://www.roblox.com/user.aspx?username=$username" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)
if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m
"
elif [[ $check1 == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://foursquare.com/%s
" $username
printf "https://foursquare.com/%s
" $username >> $username.txt
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Gumroad: \e[0m"
check1=$(curl -s -i "https://www.gumroad.com/$username" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)
if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m
"
elif [[ $check1 == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://www.gumroad.com/%s
" $username
printf "https://www.gumroad.com/%s
" $username >> $username.txt
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Newgrounds: \e[0m"
check1=$(curl -s -i "https://$username.newgrounds.com" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404 ' ; echo $?)
if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m
"
elif [[ $check1 == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://%s.newgrounds.com
" $username
printf "https://%s.newgrounds.com
" $username >> $username.txt
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Wattpad: \e[0m"
check1=$(curl -s -i "https://www.wattpad.com/user/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404 ' ; echo $?)
if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m
"
elif [[ $check1 == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://www.wattpad.com/user/%s
" $username
printf "https://www.wattpad.com/user/%s
" $username >> $username.txt
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Canva: \e[0m"
check1=$(curl -s -i "https://www.canva.com/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404 ' ; echo $?)
if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m
"
elif [[ $check1 == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://www.canva.com/%s
" $username
printf "https://www.canva.com/%s
" $username >> $username.txt
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] CreativeMarket: \e[0m"
check1=$(curl -s -i "https://creativemarket.com/$username" -H "Accept-Language: en" -L | grep -o '404eef72' ; echo $?)
if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m
"
elif [[ $check1 == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://creativemarket.com/%s
" $username
printf "https://creativemarket.com/%s
" $username >> $username.txt
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Trakt: \e[0m"
check1=$(curl -s -i "https://www.trakt.tv/users/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404 ' ; echo $?)
if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m
"
elif [[ $check1 == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://www.trakt.tv/users/%s
" $username
printf "https://www.trakt.tv/users/%s
" $username >> $username.txt
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] 500px: \e[0m"
check1=$(curl -s -i "https://500px.com/$username" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)
if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m
"
elif [[ $check1 == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://500px.com/%s
" $username
printf "https://500px.com/%s
" $username >> $username.txt
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Buzzfeed: \e[0m"
check1=$(curl -s -i "https://buzzfeed.com/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)
if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m
"
elif [[ $check1 == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://buzzfeed.com/%s
" $username
printf "https://buzzfeed.com/%s
" $username >> $username.txt
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] TripAdvisor: \e[0m"
check1=$(curl -s -i "https://tripadvisor.com/members/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)
if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m
"
elif [[ $check1 == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://tripadvisor.com/members/%s
" $username
printf "https://tripadvisor.com/members/%s
" $username >> $username.txt
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] HubPages: \e[0m"
check1=$(curl -s -i "https://$username.hubpages.com" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)
if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m
"
elif [[ $check1 == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://%s.hubpages.com/
" $username
printf "https://%s.hubpages.com/
" $username >> $username.txt
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Contently: \e[0m"
check1=$(curl -s -i "https://$username.contently.com" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)
if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m
"
elif [[ $check1 == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://%s.contently.com
" $username
printf "https://%s.contently.com
" $username >> $username.txt
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Houzz: \e[0m"
check1=$(curl -s -i "https://houzz.com/user/$username" -H "Accept-Language: en" -L | grep -o 'an error has occurred' ; echo $?)
if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m
"
elif [[ $check1 == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://houzz.com/user/%s
" $username
printf "https://houzz.com/user/%s
" $username >> $username.txt
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] blip.fm: \e[0m"
check1=$(curl -s -i "https://blip.fm/$username" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)
if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m
"
elif [[ $check1 == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://blip.fm/%s
" $username
printf "https://blip.fm/%s
" $username >> $username.txt
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Wikipedia: \e[0m"
check1=$(curl -s -i "https://www.wikipedia.org/wiki/User:$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)
if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m
"
elif [[ $check1 == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://www.wikipedia.org/wiki/User:%s
" $username
printf "https://www.wikipedia.org/wiki/User:%s
" $username >> $username.txt
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] HackerNews: \e[0m"
check1=$(curl -s -i "https://news.ycombinator.com/user?id=$username" -H "Accept-Language: en" -L | grep -o 'No such user' ; echo $?)
if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m
"
elif [[ $check1 == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://news.ycombinator.com/user?id=%s
" $username
printf "https://news.ycombinator.com/user?id=%s
" $username >> $username.txt
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] CodeMentor: \e[0m"
check1=$(curl -s -i "https://www.codementor.io/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)
if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m
"
elif [[ $check1 == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://www.codementor.io/%s
" $username
printf "https://www.codementor.io/%s
" $username >> $username.txt
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] ReverbNation: \e[0m"
check1=$(curl -s -i "https://www.reverbnation.com/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)
if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m
"
elif [[ $check1 == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://www.reverbnation.com/%s
" $username
printf "https://www.reverbnation.com/%s
" $username >> $username.txt
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Designspiration: \e[0m"
check1=$(curl -s -i "https://www.designspiration.net/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)
if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m
"
elif [[ $check1 == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://www.designspiration.net/%s
" $username
printf "https://www.designspiration.net/%s
" $username >> $username.txt
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Bandcamp: \e[0m"
check1=$(curl -s -i "https://www.bandcamp.com/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)
if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m
"
elif [[ $check1 == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://www.bandcamp.com/%s
" $username
printf "https://www.bandcamp.com/%s
" $username >> $username.txt
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] ColourLovers: \e[0m"
check1=$(curl -s -i "https://www.colourlovers.com/love/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)
if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m
"
elif [[ $check1 == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://www.colourlovers.com/love/%s
" $username
printf "https://www.colourlovers.com/love/%s
" $username >> $username.txt
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] IFTTT: \e[0m"
check1=$(curl -s -i "https://www.ifttt.com/p/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)
if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m
"
elif [[ $check1 == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://www.ifttt.com/p/%s
" $username
printf "https://www.ifttt.com/p/%s
" $username >> $username.txt
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Ebay: \e[0m"
check1=$(curl -s -i "https://www.ebay.com/usr/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found\|eBay Profile - error' ; echo $?)
if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m
"
elif [[ $check1 == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://www.ebay.com/usr/%s
" $username
printf "https://www.ebay.com/usr/%s
" $username >> $username.txt
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Slack: \e[0m"
check1=$(curl -s -i "https://$username.slack.com" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)
if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m
"
elif [[ $check1 == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://%s.slack.com
" $username
printf "https://%s.slack.com
" $username >> $username.txt
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] OkCupid: \e[0m"
check1=$(curl -s -i "https://www.okcupid.com/profile/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)
if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m
"
elif [[ $check1 == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://www.okcupid.com/profile/%s
" $username
printf "https://www.okcupid.com/profile/%s
" $username >> $username.txt
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Trip: \e[0m"
check1=$(curl -s -i "https://www.trip.skyscanner.com/user/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found\|HTTP/2 410' ; echo $?)
if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m
"
elif [[ $check1 == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://www.trip.skyscanner.com/user/%s
" $username
printf "https://www.trip.skyscanner.com/user/%s
" $username >> $username.txt
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Ello: \e[0m"
check1=$(curl -s -i "https://ello.co/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)
if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m
"
elif [[ $check1 == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://ello.co/%s
" $username
printf "https://ello.co/%s
" $username >> $username.txt
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Tracky: \e[0m"
check1=$(curl -s -i "https://tracky.com/user/$username" -H "Accept-Language: en" -L | grep -o 'profile:username' ; echo $?)
if [[ $check1 == *'1'* ]] ; then
printf "\e[1;93mNot Found!\e[0m
"
elif [[ $check1 == *'0'* ]]; then
printf "\e[1;92m Found!\e[0m https://tracky.com/~%s
" $username
printf "https://tracky.com/~%s
" $username >> $username.txt
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Tripit: \e[0m"
check1=$(curl -s -i "https://www.tripit.com/people/$username#/profile/basic-info" -H "Accept-Language: en" -L | grep -o 'location: https://www.tripit.com/home' ; echo $?)
if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m
"
elif [[ $check1 == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://www.tripit.com/people/%s#/profile/basic-info
" $username
printf "https://www.tripit.com/people/%s#/profile/basic-info
" $username >> $username.txt
fi
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Basecamp: \e[0m"
check1=$(curl -s -i "https://$username.basecamphq.com/login" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)
if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m
"
elif [[ $check1 == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://%s.basecamphq.com/login
" $username
printf "https://%s.basecamphq.com/login
" $username >> $username.txt
fi
partial
}
banner
scanner
