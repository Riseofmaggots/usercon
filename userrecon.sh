#!/bin/bash
# UserRecon v1.0
# Author: @issamelferkh
# Give me the credits if you use any part of this code, read the License.

trap 'printf "\n";partial;exit 1' 2

banner() {



printf "                                                   \e[1;92m.-\"\"\"\"-. \e[0m\n"
printf "                                                  \e[1;92m/        \ \e[0m\n"
printf "\e[1;77m  _   _               ____                       \e[0m\e[1;92m/_        _\ \e[0m\n"
printf "\e[1;77m | | | |___  ___ _ __|  _ \ ___  ___ ___  _ __  \e[0m\e[1;92m// \      / \\ \e[0m\n"
printf "\e[1;77m | | | / __|/ _ \ '__| |_) / _ \/ __/ _ \| '_ \ \e[0m\e[1;92m|\__\    /__/| \e[0m\n"
printf "\e[1;77m | |_| \__ \  __/ |  |  _ <  __/ (_| (_) | | | | \e[0m\e[1;92m\    ||    / \e[0m\n"
printf "\e[1;77m  \___/|___/\___|_|  |_| \_\___|\___\___/|_| |_|  \e[0m\e[1;92m\        / \e[0m\n"
printf "                   \e[1;92mv1.0, Author: @issamelferkh  \e[0m   \e[1;92m\  __  / \e[0m\n"
printf "                                                    \e[1;92m'.__.' \e[0m\n"
                                                


}

partial() {

if [[ -e $username.txt ]]; then
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Saved:\e[0m\e[1;77m %s.txt\n" $username
fi


}

scanner() {

read -p $'\e[1;92m[\e[0m\e[1;77m?\e[0m\e[1;92m] Input Username:\e[0m ' username

if [[ -e $username.txt ]]; then
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Removing previous file:\e[0m\e[1;77m %s.txt" $username
rm -rf $username.txt
fi
printf "\n"
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Checking username\e[0m\e[1;77m %s\e[0m\e[1;92m on: \e[0m\n" $username

## INSTAGRAM

check_insta=$(curl -s -H "Accept-Language: en" "https://www.instagram.com/$username" -L | grep -o 'The link you followed may be broken'; echo $?)
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Instagram: \e[0m"

if [[ $check_insta == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://www.instagram.com/%s\n" $username
printf "https://www.instagram.com/%s\n" $username > $username.txt
elif [[ $check_insta == *'0'* ]]; then
printf "\e[1;93mNot Found!\e[0m\n"
fi

## ONLYFANS

check_onlyfans=$(curl -s -H "Accept-Language: en" "https://www.onlyfans.com/$username" -L | grep -o 'The link you followed may be broken'; echo $?)
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Onlyfans: \e[0m"

if [[ $check_onlyfans == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://www.onlyfans.com/%s\n" $username
printf "https://onlyfans.com.com/%s\n" $username > $username.txt
elif [[ $check_onlyfans == *'0'* ]]; then
printf "\e[1;93mNot Found!\e[0m\n"
fi

## fapello

check_fapello=$(curl -s -H "Accept-Language: en" "https://www.fapello.com/$username" -L | grep -o 'The link you followed may be broken'; echo $?)
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Fapello: \e[0m"

if [[ $check_fapello == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://www.fapello.com/%s\n" $username
printf "https://www.fapello.com/%s\n" $username > $username.txt
elif [[ $check_fapello == *'0'* ]]; then
printf "\e[1;93mNot Found!\e[0m\n"
fi

## faponic

check_faponic=$(curl -s -H "Accept-Language: en" "https://www.faponic.com/$username" -L | grep -o 'The link you followed may be broken'; echo $?)
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Faponic: \e[0m"

if [[ $check_faponic == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://www.faponic.com/%s\n" $username
printf "https://www.faponic.com/%s\n" $username > $username.txt
elif [[ $check_faponic == *'0'* ]]; then
printf "\e[1;93mNot Found!\e[0m\n"
fi

## Facebook

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Facebook: \e[0m"
check_face=$(curl -s "https://www.facebook.com/$username" -L -H "Accept-Language: en" | grep -o 'not found'; echo $?)


if [[ $check_face == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://www.facebook.com/%s\n" $username
printf "https://www.facebook.com/%s\n" $username >> $username.txt
elif [[ $check_face == *'0'* ]]; then
printf "\e[1;93mNot Found!\e[0m\n"
fi

## TWITTER 

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Twitter: \e[0m"
check_twitter=$(curl -s "https://www.twitter.com/$username" -L -H "Accept-Language: en" | grep -o 'page doesn’t exist'; echo $?)


if [[ $check_twitter == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://www.twitter.com/%s\n" $username
printf "https://www.twitter.com/%s\n" $username >> $username.txt
elif [[ $check_twitter == *'0'* ]]; then
printf "\e[1;93mNot Found!\e[0m\n"
fi

## YOUTUBE

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] YouTube: \e[0m"
check_youtube=$(curl -s "https://www.youtube.com/$username" -L -H "Accept-Language: en" | grep -o 'Not Found'; echo $?)


if [[ $check_youtube == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://www.youtube.com/%s\n" $username
printf "https://www.youtube.com/%s\n" $username >> $username.txt
elif [[ $check_youtube == *'0'* ]]; then
printf "\e[1;93mNot Found!\e[0m\n"
fi

## BLOGGER

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Blogger: \e[0m"
check=$(curl -s "https://$username.blogspot.com" -L -H "Accept-Language: en" -i | grep -o 'HTTP/2 404'; echo $?)


if [[ $check == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://%s.blogspot.com\n" $username
printf "https://%s.blogspot.com\n" $username >> $username.txt
elif [[ $check == *'0'* ]]; then
printf "\e[1;93mNot Found!\e[0m\n"
fi

## GLOOGLE PLUS

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] GooglePlus: \e[0m"
check=$(curl -s "https://plus.google.com/+$username/posts" -L -H "Accept-Language: en" -i | grep -o 'HTTP/2 404' ; echo $?)


if [[ $check == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://plus.google.com/+%s/posts\n" $username
printf "https://plus.google.com/+%s/posts\n" $username >> $username
elif [[ $check == *'0'* ]]; then
printf "\e[1;93mNot Found!\e[0m\n"
fi

## REDDIT

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Reddit: \e[0m"
check1=$(curl -s -i "https://www.reddit.com/user/$username" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | head -n1 | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://www.reddit.com/user/%s\n" $username
printf "https://www.reddit.com/user/%s\n" $username >> $username.txt
fi

## PINTEREST

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Pinterest: \e[0m"
check1=$(curl -s -i "https://www.pinterest.com/$username" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o '?show_error' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://www.pinterest.com/%s\n" $username
printf "https://www.pinterest.com/%s\n" $username >> $username.txt
fi

## GITHUB

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Github: \e[0m"
check1=$(curl -s -i "https://www.github.com/$username" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://www.github.com/%s\n" $username
printf "https://www.github.com/%s\n" $username >> $username.txt
fi

## TUMBLR

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Tumblr: \e[0m"
check1=$(curl -s -i "https://$username.tumblr.com" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://%s.tumblr.com\n" $username
printf "https://%s.tumblr.com\n" $username >> $username.txt
fi

## FLICKR

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Flickr: \e[0m"
check1=$(curl -s -i "https://www.flickr.com/people/$username" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o 'Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://www.flickr.com/photos/%s\n" $username
printf "https://www.flickr.com/photos/%s\n" $username >> $username.txt
fi

## STEAM

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Steam: \e[0m"
check1=$(curl -s -i "https://steamcommunity.com/id/$username" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o 'The specified profile could not be found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://steamcommunity.com/id/%s\n" $username
printf "https://steamcommunity.com/id/%s\n" $username >> $username.txt
fi

## VIMEO

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Vimeo: \e[0m"
check1=$(curl -s -i "https://vimeo.com/$username" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://vimeo.com/%s\n" $username
printf "https://vimeo.com/%s\n" $username >> $username.txt
fi

## DEVIANTART

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] DeviantART: \e[0m"
check1=$(curl -s -i "https://$username.deviantart.com" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://%s.deviantart.com\n" $username
printf "https://%s.deviantart.com\n" $username >> $username.txt
fi

## About.me

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] About.me: \e[0m"
check1=$(curl -s -i "https://about.me/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://about.me/%s\n" $username
printf "https://about.me/%s\n" $username >> $username.txt
fi

## Imgur

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Imgur: \e[0m"
check1=$(curl -s -i "https://imgur.com/user/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://imgur.com/user/%s\n" $username
printf "https://imgur.com/user/%s\n" $username >> $username.txt
fi

## FlipBoard

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Flipboard: \e[0m"
check1=$(curl -s -i "https://flipboard.com/@$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://flipboard.com/@%s\n" $username
printf "https://flipboard.com/@%s\n" $username >> $username.txt
fi

## Spotify

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Spotify: \e[0m"
check1=$(curl -s -i "https://open.spotify.com/user/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://open.spotify.com/user/%s\n" $username
printf "https://open.spotify.com/user/%s\n" $username >> $username.txt
fi

## Patreon

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Patreon: \e[0m"
check1=$(curl -s -i "https://www.patreon.com/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://www.patreon.com/%s\n" $username
printf "https://www.patreon.com/%s\n" $username >> $username.txt
fi

## Etsy

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Etsy: \e[0m"
check1=$(curl -s -i "https://www.etsy.com/shop/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://www.etsy.com/shop/%s\n" $username
printf "https://www.etsy.com/shop/%s\n" $username >> $username.txt
fi

## CashMe

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] CashMe: \e[0m"
check1=$(curl -s -i "https://cash.me/$username" -H "Accept-Language: en" -L | grep -o '404 Not Found'; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://cash.me/%s\n" $username
printf "https://cash.me/%s\n" $username >> $username.txt
fi

## Pastebin

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Pastebin: \e[0m"
check1=$(curl -s -i "https://pastebin.com/u/$username" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o 'location: /index' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://pastebin.com/u/%s\n" $username
printf "https://pastebin.com/u/%s\n" $username >> $username.txt
fi

## Buzzfeed

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Buzzfeed: \e[0m"
check1=$(curl -s -i "https://buzzfeed.com/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://buzzfeed.com/%s\n" $username
printf "https://buzzfeed.com/%s\n" $username >> $username.txt
fi

## Wikipedia

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Wikipedia: \e[0m"
check1=$(curl -s -i "https://www.wikipedia.org/wiki/User:$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://www.wikipedia.org/wiki/User:%s\n" $username
printf "https://www.wikipedia.org/wiki/User:%s\n" $username >> $username.txt
fi

## Slack

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Slack: \e[0m"
check1=$(curl -s -i "https://$username.slack.com" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://%s.slack.com\n" $username
printf "https://%s.slack.com\n" $username >> $username.txt
fi

## OkCupid

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] OkCupid: \e[0m"
check1=$(curl -s -i "https://www.okcupid.com/profile/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://www.okcupid.com/profile/%s\n" $username
printf "https://www.okcupid.com/profile/%s\n" $username >> $username.txt
fi


partial
}
banner
scanner
