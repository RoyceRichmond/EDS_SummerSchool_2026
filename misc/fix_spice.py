import sys
import os
import re

def fix_spice_file(file_path):
    # 1. Validar que el archivo realmente exista
    if not os.path.exists(file_path):
        print(f"Error: El archivo '{file_path}' no existe.")
        sys.exit(1)
        
    # 2. Leer el contenido del archivo .spice
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            content = f.read()
    except Exception as e:
        print(f"Error al leer el archivo: {e}")
        sys.exit(1)

    # 3. Definir el patrón Regex
    # ^M           -> Busca una 'M' al inicio de una línea
    # (.*?)        -> Grupo 1: Captura texto intermedio (nodos de conexión)
    # (\b[np]fet\S*) -> Grupo 2: Busca nfet o pfet (ej. nfet_03v3)
    # (.*)$        -> Grupo 3: Captura el resto de la línea (dimensiones L, W, nf...)
    pattern = r"^M(.*?)\b([np]fet\S*)(.*)$"
    
    # Usamos re.subn en lugar de re.sub para que nos diga cuántas sustituciones hizo
    fixed_content, count = re.subn(pattern, r"XM\1\2\3", content, flags=re.MULTILINE)
    
    if count == 0:
        print("No se encontraron transistores M (nfet/pfet) que requirieran modificación.")
        return

    # 4. Guardar los cambios sobrescribiendo el archivo original
    try:
        with open(file_path, 'w', encoding='utf-8') as f:
            f.write(fixed_content)
        print(f"Éxito: Se corrigieron {count} transistores en '{file_path}'.")
    except Exception as e:
        print(f"Error al escribir en el archivo: {e}")
        sys.exit(1)

if __name__ == "__main__":
    # Validar que el usuario haya pasado el nombre del archivo como argumento
    if len(sys.argv) < 2:
        print("Uso incorrecto.")
        print("Modo de uso: python3 spice_fix.py <nombre_del_archivo.spice>")
        sys.exit(1)
        
    # sys.argv[1] toma el primer argumento de la terminal (el nombre del archivo)
    target_file = sys.argv[1]
    fix_spice_file(target_file)