-- 1. Cargar las opciones básicas del editor (números de línea, espacios, etc.)
require('core.options')

-- 2. Cargar tus atajos de teclado globales y autocomandos básicos
require('core.keymaps')

-- 3. Iniciar el gestor de plugins (vim.pack) y cargar todos tus plugins mapeados
require('plugins.init')
