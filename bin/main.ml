open Core

let () =
  (* Read the JSON file *)
  let json =
    Yojson.Basic.from_file "/home/zion/.config/hyprswitch/config.json"
  in

  (* Locally open the JSON manipulation functions *)
  let open Yojson.Basic.Util in
  let lists = json |> to_list in
  List.iter lists ~f:(fun json ->
      let open Yojson.Basic.Util in
      let mons = json |> member "mons" |> to_string in
      let cmds = json |> member "cmds" |> to_list |> filter_string in

      printf "Mons: %s\n" mons;
      printf "Cmds: %s\n" (String.concat cmds ~sep:", \n"));
  ()
