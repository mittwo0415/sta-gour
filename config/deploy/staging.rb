set :ssh_options, {
  keys: [
    # 以下に変更
    File.expand_path('~/.ssh/github-actions')
  ],
}