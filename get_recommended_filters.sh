#!/bin/bash

# create an empty input.csv file
touch input.csv

# declare an array of urls
urls=(
  https://raw.githubusercontent.com/mullvad/dns-blocklists/main/output/doh/doh_adblock.txt
  https://raw.githubusercontent.com/mullvad/dns-blocklists/main/output/doh/doh_gambling.txt
  https://raw.githubusercontent.com/mullvad/dns-blocklists/main/output/doh/doh_privacy.txt
  https://raw.githubusercontent.com/FadeMind/hosts.extras/master/add.Risk/hosts
  https://raw.githubusercontent.com/DandelionSprout/adfilt/master/Alternate%20versions%20Anti-Malware%20List/AntiMalwareHosts.txt
  https://adaway.org/hosts.txt
  https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts
  https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/gambling/hosts
  https://raw.githubusercontent.com/bigdargon/hostsVN/master/hosts
  https://raw.githubusercontent.com/DandelionSprout/adfilt/master/ClearURLs%20for%20uBo/clear_urls_uboified.txt
  https://raw.githubusercontent.com/DandelionSprout/adfilt/master/RickrollLinkIdentifier.txt
  https://raw.githubusercontent.com/DandelionSprout/adfilt/master/I%20Don%27t%20Want%20to%20Download%20Your%20Browser.txt
  https://raw.githubusercontent.com/DandelionSprout/adfilt/master/BrowseWebsitesWithoutLoggingIn.txt
  https://raw.githubusercontent.com/DandelionSprout/adfilt/master/AdRemovalListForUnusualAds.txt
  https://abpvn.com/filter/abpvn-2KCGM2.txt
  https://abpvn.com/android/abpvn.txt
  https://raw.githubusercontent.com/cbuijs/accomplist/master/typosquat/plain.black.domain.list
  https://raw.githubusercontent.com/DandelionSprout/adfilt/master/Alternate%20versions%20Anti-Malware%20List/AntiMalwareDomains.txt
  https://raw.githubusercontent.com/sophoslabs/covid-iocs/master/malicious_domains.txt
  https://blocklistproject.github.io/Lists/alt-version/ransomware-nl.txt
  https://blocklistproject.github.io/Lists/alt-version/crypto-nl.txt
  https://blocklistproject.github.io/Lists/alt-version/gambling-nl.txt
  https://s3.amazonaws.com/lists.disconnect.me/simple_ad.txt
  https://s3.amazonaws.com/lists.disconnect.me/simple_tracking.txt
  https://s3.amazonaws.com/lists.disconnect.me/simple_malvertising.txt
  https://secure.fanboy.co.nz/fanboy-annoyance.txt
  https://raw.githubusercontent.com/jerryn70/GoodbyeAds/master/Hosts/GoodbyeAds.txt
  https://www.github.developerdan.com/hosts/lists/ads-and-tracking-extended.txt
  https://pgl.yoyo.org/as/serverlist.php?hostformat%3Ddomains%26mimetype%3Dplaintext
  https://someonewhocares.org/hosts/zero/hosts
  https://raw.githubusercontent.com/nextdns/native-tracking-domains/main/domains/alexa
  https://raw.githubusercontent.com/nextdns/native-tracking-domains/main/domains/huawei
  https://raw.githubusercontent.com/nextdns/native-tracking-domains/main/domains/roku
  https://raw.githubusercontent.com/nextdns/native-tracking-domains/main/domains/samsung
  https://raw.githubusercontent.com/nextdns/native-tracking-domains/main/domains/sonos
  https://raw.githubusercontent.com/nextdns/native-tracking-domains/main/domains/windows
  https://raw.githubusercontent.com/nextdns/native-tracking-domains/main/domains/xiaomi
  https://raw.githubusercontent.com/nextdns/native-tracking-domains/main/domains/apple
  https://raw.githubusercontent.com/sjhgvr/oisd/main/domainswild_big.txt
  https://raw.githubusercontent.com/jerryn70/GoodbyeAds/master/Extension/GoodbyeAds-Spotify-AdBlock.txt
  https://phishing.army/download/phishing_army_blocklist.txt
  https://raw.githubusercontent.com/crazy-max/WindowsSpyBlocker/master/data/hosts/spy.txt
  https://winhelp2002.mvps.org/hosts.txt
  https://raw.githubusercontent.com/DandelionSprout/adfilt/master/LegitimateURLShortener.txt
  https://raw.githubusercontent.com/AdguardTeam/FiltersRegistry/master/filters/filter_11_Mobile/filter.txt
  https://adguardteam.github.io/AdGuardSDNSFilter/Filters/filter.txt
  https://easylist.to/easylist/easylist.txt
  https://easylist.to/easylist/easyprivacy.txt
  https://raw.githubusercontent.com/anudeepND/blacklist/master/adservers.txt
  https://raw.githubusercontent.com/Ultimate-Hosts-Blacklist/BaddBoyzHosts/master/clean.list
  https://raw.githubusercontent.com/nextdns/cname-cloaking-blocklist/master/domains
  https://easylist-downloads.adblockplus.org/easylistchina.txt
  https://raw.githubusercontent.com/jdlingyu/ad-wars/master/hosts
  https://raw.githubusercontent.com/tiuxo/hosts/master/ads
)

# loop through the urls and download each file with curl
for url in "${urls[@]}"; do
  # get the file name from the url
  file=$(basename "$url")
  # download the file with curl and save it as file.txt
  curl -o "$file.txt" "$url"
  # append the file contents to input.csv and add a newline
  cat "$file.txt" >>input.csv
  echo "" >>input.csv
  # remove the file.txt
  rm "$file.txt"
done

# print a message when done
echo "Done. The input.csv file contains merged data from recommended filter lists."
