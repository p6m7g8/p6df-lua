p6df::modules::lua::version() { echo "0.0.1" }
p6df::modules::lua::deps()    { 
	ModuleDeps=(
	)
}

p6df::modules::lua::external::brew() {
}

p6df::modules::lua::init() {

  p6df::modules::lua::luaenv::init
}

p6df::modules::lua::luaenv::init() {
    [ -n "$DISABLE_ENVS" ] && return

    export LUAENV_ROOT=/Users/pgollucci/.local/share/cehoffman/luaenv
    p6dfz::util::path_if $LUAENV_ROOT/bin

    if [ -x $LUAENV_ROOT/bin/luaenv ]; then
      export HAS_LUAENV=1
      eval "$(luaenv init - zsh)"
    fi
}

p6df::prompt::lua::line() {

  env_version "lua"
}

p6df::modules::lua::init
