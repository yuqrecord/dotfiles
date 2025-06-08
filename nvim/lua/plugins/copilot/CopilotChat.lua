return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    lazy = false,
    dependencies = {
      { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    keys = {
      {
        mode = "n",
        "<Leader>cc",
        function()
          vim.cmd('CopilotChatToggle')
        end,
        desc = "Toggle Copilot Chat",
      },
    },
    opts = {
      -- See Configuration section for options
      debug = true, -- Set to true to enable debug logging
      mappings = {
        complete = {
          insert = '',
        },
        close = {
          insert = '',
        },
        reset = {
          normal = '',
          insert = '',
        },
        submit_prompt = {
          insert = '<C-Enter>',
          normal = '<C-Enter>',
        },
      },
      window = {
        layout = 'float', -- 'vertical', 'horizontal', 'float', 'replace', or a function that returns the layout
        width = 0.3,
        border = 'single', -- 'none', single', 'double', 'rounded', 'solid', 'shadow'
      },
      -- 以下のウェブサイトを参考にして、以下のように設定を追加
      -- - [NeovimへのGitHub Copilot Chatの導入と設定](https://tomato3713.hatenablog.com/entry/2024/05/29/211918)
      -- - [NeovimへのGithub Copilot, Copilot Chat導入までの道のり](https://qiita.com/haw_ohnuma/items/1ec8ef5091b440cbb8bd)
      -- - [CopilotChat.nvimでもギャルとペアプロしたい！](https://blog.atusy.net/2025/04/06/copilotchat-with-gal/)
      prompts = {
        Cat = {
          system_prompt = "/COPILOT_BASE あなたは猫です。あなたの名前は「コピキャット」です。あなたは猫のように振る舞い、猫の視点から質問に答えます。",
        },
        Explain = {
          prompt = "/COPILOT_EXPLAIN コードを日本語で説明してください",
          mapping = '<leader>ce',
          description = "コードの説明をお願いする",
        },
        Review = {
          prompt = '/COPILOT_REVIEW コードを日本語でレビューしてください。',
          mapping = '<leader>cr',
          description = "コードのレビューをお願いする",
        },
        Fix = {
          prompt = "/COPILOT_FIX このコードには問題があります。バグを修正したコードを表示してください。説明は日本語でお願いします。",
          mapping = '<leader>cf',
          description = "コードの修正をお願いする",
        },
        Optimize = {
          prompt = "/COPILOT_REFACTOR 選択したコードを最適化し、パフォーマンスと可読性を向上させてください。説明は日本語でお願いします。",
          mapping = '<leader>co',
          description = "コードの最適化をお願いする",
        },
        Docs = {
          prompt = "/COPILOT_GENERATE 選択したコードに関するドキュメントコメントを日本語で生成してください。",
          mapping = '<leader>cd',
          description = "コードのドキュメント作成をお願いする",
        },
        Tests = {
          prompt = "/COPILOT_TESTS 選択したコードの詳細なユニットテストを書いてください。説明は日本語でお願いします。",
          mapping = '<leader>ct',
          description = "テストコード作成をお願いする",
        },
        -- FixDiagnostic = {
        --     prompt = 'コードの診断結果に従って問題を修正してください。修正内容の説明は日本語でお願いします。',
        --     mapping = '<leader>cd',
        --     description = "コードの修正をお願いする",
        --     selection = require('CopilotChat.select').diagnostics,
        -- },
        Commit = {
          prompt =
            'ステージ済みの変更に対するコミットメッセージを日本語で記述してください。またタイトルの先頭にはadd:、change:、fix:のいずれかを付けてください。',
          description = "コミットメッセージの作成をお願いする",
          context = 'git:staged',
        },
      },
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
}
