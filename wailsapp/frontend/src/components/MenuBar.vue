<script setup lang="ts"></script>
<template>
  <ul role="menubar" class="can-hover">
    <li role="menuitem" tabindex="0" aria-haspopup="true">
      File
      <ul role="menu">
        <li role="menuitem">
          <a href="#menubar"> Open <span>Ctrl+O</span> </a>
        </li>
        <li role="menuitem">
          <a href="#menubar"> Save <span>Ctrl+S</span> </a>
        </li>
        <li role="menuitem" class="has-divider">
          <a href="#menubar"> Save As... <span>Ctrl+Shift+S</span> </a>
        </li>
        <li role="menuitem"><a href="#menubar">Exit</a></li>
      </ul>
    </li>
    <li role="menuitem" tabindex="0" aria-haspopup="true">
      Edit
      <ul role="menu">
        <li role="menuitem"><a href="#menubar">Undo</a></li>
        <li role="menuitem"><a href="#menubar">Copy</a></li>
        <li role="menuitem"><a href="#menubar">Cut</a></li>
        <li role="menuitem" class="has-divider">
          <a href="#menubar">Paste</a>
        </li>
        <li role="menuitem"><a href="#menubar">Delete</a></li>
        <li role="menuitem"><a href="#menubar">Find...</a></li>
        <li role="menuitem"><a href="#menubar">Replace...</a></li>
        <li role="menuitem"><a href="#menubar">Go to...</a></li>
      </ul>
    </li>
    <li role="menuitem" tabindex="0" aria-haspopup="true">
      View
      <ul role="menu">
        <li role="menuitem" tabindex="0" aria-haspopup="true">
          Zoom
          <ul role="menu">
            <li role="menuitem"><button>Zoom In</button></li>
            <li role="menuitem"><button>Zoom Out</button></li>
          </ul>
        </li>
        <li role="menuitem"><a href="#menubar">Status Bar</a></li>
      </ul>
    </li>
    <li role="menuitem" tabindex="0" aria-haspopup="true">
      Help
      <ul role="menu">
        <li role="menuitem"><a href="#menubar">View Help</a></li>
        <li role="menuitem"><a href="#menubar">About</a></li>
      </ul>
    </li>
  </ul>
</template>

