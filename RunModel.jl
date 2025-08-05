using PhysiCellModelManager
createProject()
# resetDatabase() # this will delete all existing projects, so be careful!
# println("Project created successfully!")
initializeModelManager()
importProject("/Users/jeanette.johnson/josh_physicell_fork/grammar_samples/user_projects/epi_caf_antigen_presentation_h2")

config_folder = "epi_caf_antigen_presentation_h2" # replace these with the name from the output of Step 5
custom_code_folder = "epi_caf_antigen_presentation_h2"
rules_folder = "epi_caf_antigen_presentation_h2" 
ic_cell_folder = "coculture"
inputs = InputFolders(config_folder, custom_code_folder; rulesets_collection = rules_folder, ic_cell = ic_cell_folder) # also add ic_cell and ic_substrate if used

out = run(InputFolders(config_folder, custom_code_folder; rulesets_collection = rules_folder, ic_cell = ic_cell_folder); n_replicates = 1)

# using Plots # make sure to install Plots first
plot(out)
plotbycelltype(out)

# julia> xml_path = configPath("some_cell_type", "apoptosis", "death_rate") # replace with a cell type in your model
# julia> new_apoptosis_rates = [1e-5, 1e-4, 1e-3]
# julia> dv = DiscreteVariation(xml_path, new_apoptosis_rates)
# julia> out = run(inputs, dv; n_replicates = 3) # 3 replicates per apoptosis rate => 9 simulations total