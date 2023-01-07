
require 'rspreadsheet'

book = Rspreadsheet.open('./classes.ods')

sheet = book.worksheet_names
puts sheet.to_s

sheet.each do |name|
    puts name
    tab = book.worksheets( name)

    tab.rows.each do |row|
        puts row[1], row[2]
    end

    tab.images.each do |image|rub
        puts image.internal_filename
    end

end