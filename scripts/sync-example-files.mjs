import { mkdir, readFile, writeFile } from 'node:fs/promises';
import { fileURLToPath } from 'node:url';
import { dirname } from 'node:path';
import JSZip from 'jszip';

const exampleFiles = [
  {
    source: new URL('../src/data/my_project/example.py', import.meta.url),
    publicPath: 'examples/my_project/example.py',
    zipPath: 'my_project/example.py',
  },
  {
    source: new URL('../src/data/my_project/models/my_model.yaml', import.meta.url),
    publicPath: 'examples/my_project/models/my_model.yaml',
    zipPath: 'my_project/models/my_model.yaml',
  },
  {
    source: new URL('../src/data/my_project/parameters/my_parameters.yaml', import.meta.url),
    publicPath: 'examples/my_project/parameters/my_parameters.yaml',
    zipPath: 'my_project/parameters/my_parameters.yaml',
  },
];

const publicRoot = new URL('../public/', import.meta.url);
const zipOutput = new URL('examples/my_project.zip', publicRoot);
const zip = new JSZip();

for (const file of exampleFiles) {
  const content = await readFile(file.source);
  const publicFile = new URL(file.publicPath, publicRoot);

  await mkdir(dirname(fileURLToPath(publicFile)), { recursive: true });
  await writeFile(publicFile, content);
  zip.file(file.zipPath, content);
}

const zipBuffer = await zip.generateAsync({
  type: 'nodebuffer',
  compression: 'DEFLATE',
  compressionOptions: { level: 9 },
});

await mkdir(dirname(fileURLToPath(zipOutput)), { recursive: true });
await writeFile(zipOutput, zipBuffer);