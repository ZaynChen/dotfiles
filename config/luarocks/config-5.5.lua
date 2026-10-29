-- LuaRocks configuration

---@diagnostic disable: lowercase-global
rocks_trees = {
  { name = "user",   root = ".local/share/luarocks" },
  { name = "system", root = "/usr" },
}
variables = {
  LUA_DIR = "/usr",
  LUA_BINDIR = "/usr/bin",
  LUA_VERSION = "5.5",
  LUA = "/usr/bin/lua5.5",
}
