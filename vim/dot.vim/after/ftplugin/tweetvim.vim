if 0 == exists('g:tweetvim_consumer_key') || 0 == exists('g:tweetvim_consumer_secret')
  throw 'must define "g:tweetvim_consumer_key" and "g:tweetvim_consumer_secret"'
endif

NeoBundleSource TweetVim

let g:tweetvim_display_icon = 1
let g:tweetvim_tweet_per_page = 60

nnoremap <silent><buffer> s :<C-u>TweetVimSay<CR>
nnoremap <buffer><silent> tm :<C-u>TweetVimMentions<CR>
nnoremap <silent><buffer> <Leader>th :<C-u>TweetVimHomeTimeline<CR>
nnoremap <silent><buffer> [unite]l :<C-u>Unite tweetvim<CR>
nnoremap <silent><buffer> [unite]u :<C-u>Unite tweetvim/account<CR>
nnoremap : :
