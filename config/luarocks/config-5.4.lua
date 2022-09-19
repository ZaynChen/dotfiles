-- LuaRocks configuration

rocks_trees = {
  { name = "user", root = home .. "/.config/luarocks" };
  { name = "system", root = "/usr" };
}
lua_interpreter = "lua5.4";
variables = {
  LUA_DIR = "/usr";
  LUA_BINDIR = "/usr/bin";
}
