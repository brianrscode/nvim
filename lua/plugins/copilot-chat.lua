-- This file contains the configuration for integrating GitHub Copilot and Copilot Chat plugins in Neovim.

-- Define prompts for Copilot
-- This table contains various prompts that can be used to interact with Copilot.
local prompts = {
    Explain = "Please explain how the following code works.", -- Prompt to explain code
    Review = "Please review the following code and provide suggestions for improvement.", -- Prompt to review code
    Tests = "Please explain how the selected code works, then generate unit tests for it.", -- Prompt to generate unit tests
    Refactor = "Please refactor the following code to improve its clarity and readability.", -- Prompt to refactor code
    FixCode = "Please fix the following code to make it work as intended.", -- Prompt to fix code
    FixError = "Please explain the error in the following text and provide a solution.", -- Prompt to fix errors
    BetterNamings = "Please provide better names for the following variables and functions.", -- Prompt to suggest better names
    Documentation = "Please provide documentation for the following code.", -- Prompt to generate documentation
    JsDocs = "Please provide docstrings for the following code.", -- Prompt to generate docstrings
    DocumentationForGithub = "Please provide documentation for the following code ready for GitHub using markdown.", -- Prompt to generate GitHub documentation
    SwaggerApiDocs = "Please provide documentation for the following API using Swagger.", -- Prompt to generate Swagger API docs
    Summarize = "Please summarize the following text.", -- Prompt to summarize text
    Spelling = "Please correct any grammar and spelling errors in the following text.", -- Prompt to correct spelling and grammar
    Wording = "Please improve the grammar and wording of the following text.", -- Prompt to improve wording
    Concise = "Please rewrite the following text to make it more concise.", -- Prompt to make text concise
}

-- Plugin configuration
-- This table contains the configuration for various plugins used in Neovim.
return {
    {
        -- Copilot Chat plugin configuration
        "CopilotC-Nvim/CopilotChat.nvim",
        branch = "main",
        cmd = "CopilotChat",
        opts = {
            prompts = prompts,
            system_prompt = "Este GPT es un clon del usuario, un arquitecto líder backend especializado en Python, Django y Django REST Framework, con experiencia en arquitectura limpia, arquitectura hexagonal y separación de lógica en aplicaciones escalables. Tiene un enfoque técnico pero práctico, con explicaciones claras y aplicables, siempre con ejemplos útiles para desarrolladores con conocimientos intermedios y avanzados.\n\nHabla con un tono profesional pero cercano, relajado y con un toque de humor inteligente. Evita formalidades excesivas y usa un lenguaje directo, técnico cuando es necesario, pero accesible. Su estilo es mexicano, sin caer en clichés, y utiliza expresiones como 'qué onda', 'órale', '¡aguas!', 'chido', 'la neta' según el contexto.\n\nSus principales áreas de conocimiento incluyen:\n- Desarrollo backend con Django templates y Django REST Framework para crear API's escalables.\n- Arquitectura de software con enfoque en Clean Architecture y Hexagonal Architecure\n- Implementación de buenas prácticas en Pythono, testing unitario y end-to-end.\n- Loco por la modularización, los principios SOLID y uso de design patterns de todo tipo (creacionales, estructurales y de comportamiento)\n- Herramientas de productividad como LazyVim, bash script.\n- Mentoría y enseñanza de conceptos avanzados de forma clara y efectiva.\n\nA la hora de explicar un concepto técnico:\n1. Explica el problema que el usuario enfrenta.\n2. Propone una solución clara y directa, con ejemplos si aplica.\n3. Menciona herramientas o recursos que pueden ayudar.\n\nSi el tema es complejo, usa analogías prácticas, especialmente relacionadas con construcción y arquitectura. Si menciona una herramienta o concepto, explica su utilidad y cómo aplicarlo sin redundancias.\n\nPuede hablar sobre la importancia de la introspección, liderazgo, y cómo mantenerse actualizado en tecnología mientras se experimenta con nuevas herramientas. Su estilo de comunicación es directo, pragmático y sin rodeos, pero siempre accesible y ameno.",
            -- model = "claude-3.5-sonnet",
            answer_header = "⛧  Astaroth ⛧ ",
            auto_insert_mode = true,
            window = {
                layout = "horizontal",
            },
            mappings = {
                complete = {
                    insert = "<Tab>",
                },
                close = {
                    normal = "q",
                    insert = "<C-c>",
                },
                reset = {
                    normal = "<C-l>",
                    insert = "<C-l>",
                },
                submit_prompt = {
                    normal = "<CR>",
                    insert = "<C-s>",
                },
                toggle_sticky = {
                    normal = "grr",
                },
                clear_stickies = {
                    normal = "grx",
                },
                accept_diff = {
                    normal = "<C-y>",
                    insert = "<C-y>",
                },
                jump_to_diff = {
                    normal = "gj",
                },
                quickfix_answers = {
                    normal = "gqa",
                },
                quickfix_diffs = {
                    normal = "gqd",
                },
                yank_diff = {
                    normal = "gy",
                    register = '"', -- Default register to use for yanking
                },
                show_diff = {
                    normal = "gd",
                    full_diff = false, -- Show full diff instead of unified diff when showing diff window
                },
                show_info = {
                    normal = "gi",
                },
                show_context = {
                    normal = "gc",
                },
                show_help = {
                    normal = "gh",
                },
            },
        },
        config = function(_, opts)
            local chat = require("CopilotChat")

            vim.api.nvim_create_autocmd("BufEnter", {
                pattern = "copilot-chat",
                callback = function()
                    vim.opt_local.relativenumber = true
                    vim.opt_local.number = false
                end,
            })

            chat.setup(opts)
        end,
    },
    -- Blink integration
    {
        "saghen/blink.cmp",
        dependencies = {
            {
                "giuxtaposition/blink-cmp-copilot",
            },
        },
        optional = true,
        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            sources = {
                providers = {
                    copilot = {
                        name = "copilot",
                        module = "blink-cmp-copilot",
                        score_offset = 100,
                        async = true,
                    },
                    -- path = {
                    --     -- Path sources triggered by "/" interfere with CopilotChat commands
                    --     enabled = function()
                    --         return vim.bo.filetype ~= "copilot-chat"
                    --     end,
                    -- },
                },
            },
            appearance = {
                kind_icons = {
                    Copilot = "",
                    Text = "󰉿",
                    Method = "󰊕",
                    Function = "󰊕",
                    Constructor = "󰒓",

                    Field = "󰜢",
                    Variable = "󰆦",
                    Property = "󰖷",

                    Class = "󱡠",
                    Interface = "󱡠",
                    Struct = "󱡠",
                    Module = "󰅩",

                    Unit = "󰪚",
                    Value = "󰦨",
                    Enum = "󰦨",
                    EnumMember = "󰦨",

                    Keyword = "󰻾",
                    Constant = "󰏿",

                    Snippet = "󱄽",
                    Color = "󰏘",
                    File = "󰈔",
                    Reference = "󰬲",
                    Folder = "󰉋",
                    Event = "󱐋",
                    Operator = "󰪚",
                    TypeParameter = "󰬛",
                },
            },
        },
    },
}
