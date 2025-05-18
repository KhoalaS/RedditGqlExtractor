<script setup lang="ts">
import { Terminal } from '@xterm/xterm';
import { onMounted, useTemplateRef } from 'vue';
import { WebglAddon } from '@xterm/addon-webgl';
import Window from './Window.vue';

interface CoreStub {
  buffer: {
    x: number;
  };
}

const term: Terminal & { _core?: CoreStub } = new Terminal({});
const xtermContainer = useTemplateRef('xterm-container');
let initialized = false;
let command = '';
onMounted(() => {
  if (xtermContainer.value) {
    term.open(xtermContainer.value);
    term.loadAddon(new WebglAddon());
    initialized = true;
    prompt();
  }
});

function prompt() {
  if (initialized) {
    term.write('\r\n~> ');
  }
}

term.onData((e) => {
  switch (e) {
    case '\u0003': // Ctrl+C
      term.write('^C');
      prompt();
      break;
    case '\r': // Enter
      command = '';
      prompt();
      break;
    case '\u007F': // Backspace (DEL)
      // Do not delete the prompt
      if (term._core!.buffer.x > 3) {
        term.write('\b \b');
        if (command.length > 0) {
          command = command.slice(0, command.length - 1);
        }
      }
      break;
    default: // Print all other characters for demo
      if (
        (e >= String.fromCharCode(0x20) && e <= String.fromCharCode(0x7e)) ||
        e >= '\u00a0'
      ) {
        command += e;
        term.write(e);
      }
  }
});
</script>
<template>
  <Window title="Cmd">
    <template #content>
      <div ref="xterm-container"></div>
    </template>
  </Window>
</template>
