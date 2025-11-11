{ pkgs, config, ... }:

{

  xdg.configFile."lf/icons".source = ./icons;

  programs.lf = {
    enable = true;

    settings = {
      sixel = true;
      preview = true;
      hidden = false;
      drawbox = true;
      icons = true;
      ignorecase = true;
    };

    commands = {
      dragon-out = ''%${pkgs.xdragon}/bin/xdragon -a -x "$fx"'';
      editor-open = ''$$EDITOR $f'';
      mkdir = ''
      ''${{
        printf "Directory Name: "
        read DIR
        mkdir $DIR
      }}
      '';
    };

    keybindings = {
      "\\\"" = "";
      o = "";
      c = "mkdir";
      "." = "set hidden!";
      "`" = "mark-load";
      "\\'" = "mark-load";
      "<enter>" = "open";

      do = "dragon-out";

      "g~" = "cd";
      gh = "cd";
      "g/" = "/";

      ee = "editor-open";
      V = ''''$${pkgs.bat}/bin/bat --paging=always --theme=gruvbox "$f"'';
    };

    extraConfig =
    let
      previewer = pkgs.writeShellScriptBin "pv.sh" ''
    file=$1
    w=$2
    h=$3
    x=$4
    y=$5

    mime_type=$( ${pkgs.file}/bin/file -Lb --mime-type "$file" )

    # Image Preview
    if [[ "$mime_type" =~ ^image ]]; then
        ${pkgs.kitty}/bin/kitty +kitten icat --silent --stdin no --transfer-mode file --place "''${w}x''${h}@''${x}x''${y}" "$file" </dev/null > /dev/tty
        exit 1
    fi

    # PDF Preview (using python312Packages.pdftotext)
    if [[ "$mime_type" =~ ^application/pdf ]]; then
        ${pkgs.python312Packages.pdftotext}/bin/pdftotext -m pdftotext "$file" - | ${pkgs.haskellPackages.pager}/bin/less -F -X
        exit 1
    fi

    # Text File Preview (including Markdown, JavaScript, JSON, etc.)
    if [[ "$mime_type" =~ ^text ]]; then
        # If it's a markdown file, use `bat` with Markdown syntax highlighting
        if [[ "$file" =~ \.md$ ]]; then
            ${pkgs.bat}/bin/bat --style=plain --color=always "$file"
        else
            ${pkgs.pistol}/bin/pistol "$file"
        fi
        exit 1
    fi

    # JavaScript (Preview as text)
    if [[ "$mime_type" =~ ^application/javascript ]]; then
        ${pkgs.bat}/bin/bat --style=plain --color=always "$file"
        exit 1
    fi

    # TAR File Preview (extract and list the contents)
    if [[ "$mime_type" =~ ^application/x-tar ]]; then
        tar -tvf "$file" | ${pkgs.haskellPackages.pager}/bin/less -F -X
        exit 1
    fi

    # JSON File Preview
    if [[ "$mime_type" =~ ^application/json ]]; then
        jq . "$file" | ${pkgs.haskellPackages.pager}/bin/less -F -X
        exit 1
    fi

    # Video Preview (Using mpv)
    if [[ "$mime_type" =~ ^video ]]; then
        ${pkgs.mpv}/bin/mpv --fullscreen --no-border "$file" &
        exit 1
    fi

    # Audio Preview (Using mpv)
    if [[ "$mime_type" =~ ^audio ]]; then
        ${pkgs.mpv}/bin/mpv --no-terminal --quiet --loop "$file" &
        exit 1
    fi

    # Unsupported File Type
    echo "Unsupported file type: $mime_type"
    exit 1
'';


      cleaner = pkgs.writeShellScriptBin "clean.sh" ''
      ${pkgs.kitty}/bin/kitty +kitten icat --clear --stdin no --silent --transfer-mode file < /dev/null > /dev/tty
      '';
    in
    ''
      set cleaner ${cleaner}/bin/clean.sh
      set previewer ${previewer}/bin/pv.sh
    '';

  };
}
