-- load session
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
-- 定义<session-file> 所在目录
local sessionDir = vim.fn.stdpath("data") .. "/vimSession/"
print("SessionDir = " .. sessionDir)

local function save_session()
    vim.ui.input( { prompt = 'save session name :' }, function(input)
        print(input)
        print(sessionDir..input)
        
        if( not vim.loop.fs_stat(sessionDir) )
        then 
            vim.cmd([[!mkdir ]] .. sessionDir )
        end
        vim.cmd.mksession(sessionDir..input)
        vim.notify(sessionDir..input.. " create success", vim.log.levels.INFO)
    end)
end

-- 删除选中session
local function delete_selection(prompt_bufnr, map)
    -- 关闭Prompt buffer
    actions.close(prompt_bufnr)
    -- 获取结果列表
    local selection = action_state.get_selected_entry()
    print(selection.value[1])
    -- rm <session-file> 删除选中的session file
    vim.cmd([[!rm ]] .. sessionDir .. selection.value[1])
end

-- 进入选中session
local function load_session(prompt_bufnr, map)
    actions.close(prompt_bufnr)
    local selection = action_state.get_selected_entry()
     vim.cmd([[
        bufdo bwipe
        source ]] .. sessionDir .. selection[1])
end

local _manage_session = function()
    local opts = {
        -- 绑定Actions到Mappings
        -- attach_mappings绑定的键位映射只生效于telescope的buffer，不影响全局
        attach_mappings = function(_, map)
            -- <enter>键 进入选中session
            -- map("n", "<C-j>", actions.move_selection_next)
            -- map("n", "<C->", actions.move_selection_previous)
            map("n", "<CR>", load_session)
            -- d键 删除选中session
            map("n", "d", delete_selection)
            return true
        end,
        -- 定义Finder的查找命令为ls <session-file所在的目录>
        find_command = {
            "ls",
            vim.fn.stdpath("data") .. "/vimSession/",
        },
        prompt_title = "Manage session",
    }
    require("telescope.builtin").find_files(opts)
end

-- 全局键位映射，映射<space>s键为打开telescope会话管理
vim.keymap.set("n", "<leader>S", _manage_session)

-- 将telescope会话管理包装为用户定义命令
vim.api.nvim_create_user_command("LoadSession", _manage_session, { desc = "load user session,like workspace" })
vim.api.nvim_create_user_command("SaveSession", save_session, { desc = "save user session,like workspace" })
