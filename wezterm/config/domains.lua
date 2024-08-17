return {
   -- ref: https://wezfurlong.org/wezterm/config/lua/SshDomain.html
   ssh_domains = {},

   -- ref: https://wezfurlong.org/wezterm/multiplexing.html#unix-domains
   unix_domains = {},

   -- ref: https://wezfurlong.org/wezterm/config/lua/WslDomain.html
   wsl_domains = {
      {
         name = 'WSL:ubuntu22.04',
         distribution = 'ubuntu22.04',
         username = 'pxx',
         default_cwd = '/home/pxx',
         -- default_prog = { 'fish', '-l' },
      },
   },
}
