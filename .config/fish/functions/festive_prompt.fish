function festive_prompt
  # figure out what icon to use
  switch (date "+%m")
  case '0106'
    printf '🎉  '
  case '0704'
    printf '🎆  '
  case '10**'
    printf '🎃  '
  case '112*'
    printf '🍗  '
  case '122*'
    printf '🎅  '
  case '*'
    printf 'ॐ  '
  end
end
