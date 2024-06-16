#!/bin/bash
for file in ./romn/e*; do
    match_book=$(rg -o '<p rend="book">.*?</p>' "$file")
    if [[ -n $match_book ]]; then
        clean_match=$(echo "$match_book" | sed -E 's/<p rend="book">//; s:</p>::; s:<pb[^>]*>::g')
        echo $clean_match
    else
        match_chapter=$(rg -o '<p rend="chapter">.*?</p>' "$file" | head -n 1)
        if [[ -n $match_chapter ]]; then
            clean_match=$(echo "$match_chapter" | sed -E 's/<p rend="chapter">//; s:</p>::; s:<pb[^>]*>::g')
            echo $clean_match
        fi
    fi
done
