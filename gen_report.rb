require 'odf-report'

images  = [ 0,
"/home/yves/Pictures/e3df805f99f47ef65f391868c3cb2bde.jpg",
"/home/yves/Pictures/tumblr_702b26f679abbfb064a8f9ae6e05935a_6565b090_1280.jpg"
]

@domaines = [
    {
        d: "DOMAINE 1 : Mobiliser le langage dans toutes ses dimensions",
        sub: [{
            d: "ECRIT",
            sub: [{
                d: "Production",
                competence: [
                    "Je sais différencier un texte d’une image",
                    "Je sais différencier une lettre d’un graphisme ou d’un dessin",
                    "Je reconnais mon prénom en capitales d’imprimeries",
                    "Je sais identifier des mots identiques",
                    "Je sais associer des prénoms identiques en capitale.",
                    "Je sais associer des mots identiques en capitale."
                    ]
                }]
            }]
    }
]

@domaines = @domaines + @domaines

# Open template & fill it
report = ODFReport::Report.new("./periode_template.odt") do |r|

    ## A
    r.add_section("Section1", @domaines) do |s1|
        s1.add_field(:domaine,    :d)

        s1.add_section("Section2", :sub) do |s2|
            s2.add_field(:sujet,    :d)

            s2.add_section("Section3", :sub) do |s3|
                s3.add_field(:type,    :d)

                s3.add_table("Table1", :competence, header: false) do |t|
                    t.add_column(:competence) {|item| item }
                end

            end
        end
    end

end

# generate final doc
report.generate("./new_ticket.odt")