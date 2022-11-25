--
-- Function to auto run go command on write into buffer
-- taken from this video
-- https://www.youtube.com/watch?v=HlfjpstqXwE&t=6s
--
local attach_to_buffer = function(bufnr, command)
    vim.api.nvim_create_autocmd("BufWritePost", {
        pattern = "*.go",
        group = vim.api.nvim_create_augroup("GoGroup", {clear = true}),
        callback = function()
           
            local append_data = function(_, data)
                if data then
                    vim.api.nvim_buf_set_lines(bufnr, 0, 0, false, data)
               end
            end
    
            vim.fn.jobstart(command, {
                stdout_buffered = true,
                on_stderr = append_data,
                on_stdout = append_data, 
            })
        end,
    })
end

vim.api.nvim_create_user_command("GoAutoRun", function()
   print("Run echo nvim_get_current_buf() to find buffer number") 
   local bufnr = vim.fn.input "Target Buffer Number: "
    attach_to_buffer(tonumber(bufnr), {"go" ,"run", "."})
end, {})

