local M = {}

local jdtls_path = vim.fn.stdpath('data') .. "/mason/packages/jdtls"
local path_to_lsp_server = jdtls_path .. "/config_linux"
local path_to_plugins = jdtls_path .. "/plugins"
local path_to_jar = path_to_plugins .. "/org.eclipse.equinox.launcher_1.6.500.v20230717-2134.jar"
local lombok_path = jdtls_path .. "/lombok.jar"

local jdk_dir = '/home/kraigochieng/.sdkman/candidates/java/current'
local jdk_bin = jdk_dir .. '/bin/java'

local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
local root_dir = require("jdtls.setup").find_root(root_markers)
if root_dir == "" then
    return
end

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = vim.fn.stdpath('data') .. '/site/java/workspaces/' .. project_name
function directory_exists(path)
    local ok, err, code = os.rename(path, path)
    if not ok then
        if code == 13 then
            -- Permission denied, but directory exists
            return true
        end
        if code == 2 then
            -- File or directory does not exist
            return false
        end
    end
    return true
end

-- Check if the directory exists
if not directory_exists(workspace_dir) then
    -- If it doesn't exist, create it
    os.execute("mkdir " .. workspace_dir)
else
    print("INFO: Java workspace directory already exists.")
end

M.config = {
    cmd = {
        jdk_bin,
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-javaagent:' .. lombok_path,
        -- '-Xbootclasspath/a:' .. lombok_path,
        '-Xmx1g',
        '--add-modules=ALL-SYSTEM',
        '--add-opens', 'java.base/java.util=ALL-UNNAMED',
        '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

        '-jar', path_to_jar,
        '-configuration', path_to_lsp_server,
        '-data', workspace_dir,
    },

    -- This is the default if not provided, you can remove it. Or adjust as needed.
    -- One dedicated LSP server & client will be started per unique root_dir
    root_dir = root_dir,
    settings = {
        java = {
            home = jdk_dir,
            eclipse = {
                downloadSources = true,
            },
            configuration = {
                updateBuildConfiguration = "interactive",
                runtimes = {
                    {
                        path = jdk_dir,
                    },
                }
            },
            maven = {
                downloadSources = true,
            },
            implementationsCodeLens = {
                enabled = true,
            },
            referencesCodeLens = {
                enabled = true,
            },
            references = {
                includeDecompiledSources = true,
            },
            format = {
                enabled = true,
                settings = {
                    url = vim.fn.stdpath "config" .. "/lsp/servers/eclipse-java-google-style.xml",
                    profile = "GoogleStyle",
                },
            },

        },
        signatureHelp = { enabled = true },
        completion = {
            favoriteStaticMembers = {
                "org.hamcrest.MatcherAssert.assertThat",
                "org.hamcrest.Matchers.*",
                "org.hamcrest.CoreMatchers.*",
                "org.junit.jupiter.api.Assertions.*",
                "java.util.Objects.requireNonNull",
                "java.util.Objects.requireNonNullElse",
                "org.mockito.Mockito.*",
            },
            importOrder = {
                "java",
                "javax",
                "com",
                "org"
            },
        },
        extendedClientCapabilities = extendedClientCapabilities,
        sources = {
            organizeImports = {
                starThreshold = 9999,
                staticStarThreshold = 9999,
            },
        },
        codeGeneration = {
            toString = {
                template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
            },
            useBlocks = true,
        },
    },

    flags = {
        allow_incremental_sync = true,
    },
    init_options = {
        bundles = {},
    },
}

return M
