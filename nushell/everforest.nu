let everforest_fg = "#d3c6aa"
let everforest_blue = "#7fbb3"
let everforest_yellow = "#dbbc7f"
let everforest_purple = "#d699b6"
let everforest_gray = "#928374"
let everforest_bg = "#4f5b5800"
let everforest_red = "#e67e80"
let everforest_aqua = "#83c092"
let everforest_orange = "#e69875"
let everforest_green = "#A7C080"


let everforest_green_bold = { fg: $everforest_green bg: $everforest_bg attr: b }
let everforest_purple_bold = { fg: $everforest_purple bg: $everforest_bg attr: b }
let everforest_red_bold = { fg: $everforest_red bg: $everforest_bg attr: b }
let everforest_yellow_bold = { fg: $everforest_yellow bg: $everforest_bg attr: b }
let everforest_aqua_bold = { fg: $everforest_aqua bg: $everforest_bg attr: b }
let everforest_blue_bold = { fg: $everforest_blue bg: $everforest_bg attr: b }
let everforest_gray_bold = { fg: $everforest_gray bg: $everforest_bg attr: b }

let everforest_theme = {
    separator: $everforest_fg
    leading_trailing_space_bg: { attr: n }
    header: $everforest_gray_bold
    empty: $everforest_blue
    bool: $everforest_fg
    int: $everforest_fg
    filesize: $everforest_fg
    duration: $everforest_fg
    date: $everforest_fg
    range: $everforest_fg
    float: $everforest_fg
    string: $everforest_fg
    nothing: $everforest_fg
    binary: $everforest_fg
    cellpath: $everforest_fg
    row_index: $everforest_gray
    record: $everforest_fg
    list: $everforest_fg
    block: $everforest_fg
    hints: $everforest_gray

    shape_garbage: $everforest_red_bold
    shape_binary: $everforest_purple_bold
    shape_bool: $everforest_aqua
    shape_int: $everforest_purple_bold
    shape_float: $everforest_purple_bold
    shape_range: $everforest_yellow_bold
    shape_internalcall: $everforest_aqua_bold
    shape_external: $everforest_aqua
    shape_externalarg: $everforest_green_bold
    shape_literal: $everforest_aqua
    shape_operator: $everforest_yellow
    shape_signature: $everforest_green_bold
    shape_string: $everforest_green
    shape_string_interpolation: $everforest_aqua_bold
    shape_datetime: $everforest_aqua_bold
    shape_list: $everforest_aqua_bold
    shape_table: $everforest_blue_bold
    shape_record: $everforest_aqua_bold
    shape_block: $everforest_blue_bold
    shape_filepath: $everforest_blue
    shape_globpattern: $everforest_aqua_bold
    shape_variable: $everforest_purple
    shape_flag: $everforest_blue_bold
    shape_custom: $everforest_green
    shape_nothing: $everforest_aqua
  }

