return {
  "Lachignol/time-bomb.nvim",
  config = function()
    require("time-bomb").setup({
      enable_default_keymaps = true,
      timer_color = "lime",
      pomodoro_cycles = {
        { title = "Work 1", time = "50", style = "mama-lova" }, 
        { title = "Break 1", time = "10",  style = "cyberpunk" },
        { title = "Work 2", time = "50", style = "mama-lova" },
        { title = "Break 2", time = "10",  style = "cyberpunk" },
        { title = "Wrap-up", time = "25", style = "mama-lova" },
      },
      keymaps = {
        timer_custom   = "<leader>tbc",  -- Custom timer
        pomodoro_start = "<leader>tbs",  -- Start Pomodoro
        stop_timer     = "<leader>tbxx",  -- Stop timer
        pause_timer    = "<leader>tbp",  -- Pause/Resume
        next_timer     = "<leader>tbn",  -- Next cycle
        prev_timer     = "<leader>tbb",  -- Previous cycle
      },
    })
  end,
}
