#!/bin/bash

# Fix markdown spacing in all notebooks
.venv/bin/python3 << 'EOF'
import nbformat
from pathlib import Path
import re

def fix_notebook(notebook_path):
    nb = nbformat.read(notebook_path, as_version=4)
    
    for cell in nb.cells:
        if cell.cell_type == 'markdown':
            # Remove redundant markers
            cell.source = re.sub(r'🤖\s*', '', cell.source)
            cell.source = re.sub(r'#{4,5}\s*Reply\s*', '', cell.source)
            
            # Split on separator and wrap with divs
            separator = re.compile(r'<!-- SOLVEIT_SEPARATOR_\w+ -->')
            parts = separator.split(cell.source)
            
            if len(parts) == 2:
                prompt, response = parts
                cell.source = f'<div class="prompt">\n\n{prompt.strip()}\n\n</div>\n\n<div class="response">\n\n{response.strip()}\n\n</div>'
            
            # Fix list spacing
            lines = cell.source.split('\n')
            fixed_lines = []
            
            for i, line in enumerate(lines):
                if line.strip().startswith(('-', '*', '1.')) and i > 0:
                    if fixed_lines and fixed_lines[-1].strip():
                        fixed_lines.append('')
                fixed_lines.append(line)
            
            cell.source = '\n'.join(fixed_lines)
    
    nbformat.write(nb, notebook_path)

for nb_path in Path('posts').rglob('*.ipynb'):
    print(f"Processing {nb_path}")
    fix_notebook(nb_path)
EOF

# Render with Quarto
quarto preview
