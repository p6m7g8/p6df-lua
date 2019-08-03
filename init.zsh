p6df::modules::lua::version() { echo "0.0.1" }
p6df::modules::lua::deps()    {
	ModuleDeps=(
	)
}

p6df::modules::lua::external::brew() {

}

p6df::modules::lua::home::symlink() {

  # XXX: ENV move
}

p6df::modules::lua::init() {

  p6df::modules::lua::luaenv::init "$P6_DFZ_SRC_DIR"
}

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

p6df::prompt::lua::line() {

  p6_lang_version "lua"
}
