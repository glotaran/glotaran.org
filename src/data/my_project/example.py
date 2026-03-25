from glotaran.testing.simulated_data import sequential_spectral_decay
from glotaran.project import Project
from pyglotaran_extras import plot_overview, plot_data_overview

my_dataset = sequential_spectral_decay.DATASET
my_project = Project.open("my_project")
my_project.import_data(my_dataset, dataset_name="my_data")
plot_data_overview(my_dataset)  # to explore the dataset

result = my_project.optimize("my_model", "my_parameters")

# Run each in a separate cell:
result  # to inspect the optimization result
result.optimized_parameters  # view optimized parameters
plot_overview(result)  # result plot