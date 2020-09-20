######################################################################
#<
#
# Function: p6df::modules::lua::version()
#
#>
######################################################################
p6df::modules::lua::version() { echo "0.0.1" }
######################################################################
#<
#
# Function: p6df::modules::lua::deps()
#
#>
######################################################################
p6df::modules::lua::deps()    { ModuleDeps=() }

######################################################################
#<
#
# Function: p6df::modules::lua::external::brew()
#
#>
######################################################################
p6df::modules::lua::external::brew() {

  brew install luarocks
}

######################################################################
#<
#
# Function: p6df::modules::lua::home::symlink()
#
#>
######################################################################
p6df::modules::lua::home::symlink() {

  # XXX: ENV move
}

######################################################################
#<
#
# Function: p6df::modules::lua::init()
#
#>
######################################################################
p6df::modules::lua::init() {

  p6df::modules::lua::luaenv::init "$P6_DFZ_SRC_DIR"
}

######################################################################
#<
#
# Function: p6df::modules::lua::luaenv::init(dir)
#
#  Args:
#	dir - 
#
#>
######################################################################
p6df::modules::lua::luaenv::init() {
    local dir="$1"

    [ -n "$DISABLE_ENVS" ] && return

    LUAENV_ROOT=$dir/cehoffman/luaenv

    if [ -x $LUAENV_ROOT/bin/luaenv ]; then
      export LUAENV_ROOT
      export HAS_LUAENV=1

      p6df::util::path_if $LUAENV_ROOT/bin
      eval "$(luaenv init - zsh)"
    fi
}

######################################################################
#<
#
# Function: p6df::prompt::lua::line()
#
#>
######################################################################
p6df::prompt::lua::line() {

  p6_lua_prompt_info
}

######################################################################
#<
#
# Function: str str = p6_lua_prompt_info()
#
#  Returns:
#	str - str
#
#>
######################################################################
p6_lua_prompt_info() {

  local str=$(p6_lang_version "lua")

  p6_return_str "$str"
}  
