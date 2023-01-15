{ pkgs }: {
    deps = [
        pkgs.busybox
        pkgs.bashInteractive
        pkgs.man
        pkgs.jq.bin
        pkgs.pwgen
    ];
}