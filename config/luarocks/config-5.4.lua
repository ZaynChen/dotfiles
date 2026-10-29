-- LuaRocks configuration

---@diagnostic disable: lowercase-global
rocks_trees = {
  { name = "user",   root = ".local/share/luarocks" },
  { name = "system", root = "/usr" },
}
variables = {
  LUA_DIR = "/usr",
  LUA_INCDIR = "/usr/include/lua5.4",
  LUA_BINDIR = "/usr/bin",
  LUA_VERSION = "5.4",
  LUA = "/usr/bin/lua5.4",
}
