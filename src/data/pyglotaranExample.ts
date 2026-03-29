import codeExample from './my_project/example.py?raw';
import modelExample from './my_project/models/my_model.yaml?raw';
import parametersExample from './my_project/parameters/my_parameters.yaml?raw';

export type ExampleTab = {
  id: string;
  label: string;
  language: string;
  code: string;
  description: string;
  downloadHref: string;
  downloadLabel: string;
};

export const pyglotaranExampleTabs: ExampleTab[] = [
  {
    id: 'code',
    label: 'Code',
    language: 'Python',
    description: 'Copy the code into "example.ipynb" inside your "my_project".',
    downloadHref: 'examples/my_project/example.py',
    downloadLabel: 'example.py',
    code: codeExample.trimEnd()
  },
  {
    id: 'model',
    label: 'Model',
    language: 'YAML',
    description: 'Copy this into "my_model.yaml" inside a "models" subfolder in your project.',
    downloadHref: 'examples/my_project/models/my_model.yaml',
    downloadLabel: 'my_model.yaml',
    code: modelExample.trimEnd()
  },
  {
    id: 'parameters',
    label: 'Parameters',
    language: 'YAML',
    description: 'Copy this into "my_parameters.yaml" inside a "parameters" subfolder in your project.',
    downloadHref: 'examples/my_project/parameters/my_parameters.yaml',
    downloadLabel: 'my_parameters.yaml',
    code: parametersExample.trimEnd()
  }
];