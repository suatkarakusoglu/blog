+++
title = "Process kill tool: fkill"
author = ["Suat Karakusoglu"]
description = "Kill a process easily: fkill"
date = 2021-01-24T00:00:00+03:00
keywords = ["fkill", "linux", "process"]
categories = ["Terminal", "Programming", "Linux"]
type = "post"
draft = false
+++

{{< figure src="/ox-hugo/2021-01-24_23-50-01_finish_him.jpeg" >}}

Processes are pretty much everything which works under the hood of the operating system.

Sometimes you may get pretty furious about some processes which are stuck , which prevents you, by holding on to ports and doesn’t allow you to start new processes, that is why you wanna kill, not because you are insane.

This term may seem brutal but, every killing opens opportunity for new born pretty processes. Look at that way.

Killing process is easy, what is hard is to find which one you intend to kill.

Once, i have written a long terminal command and was using it with back searching.
Such command was to kill 8080 process:

```shell
lsof -i4TCP:8080
```

Get related line

```shell
lsof -i4TCP:8080 | tail -1
```

Find related column

```shell
lsof -i4TCP:8080 | tail -1 | awk ‘{print $2}’ | xargs sudo kill
```


## It is time for <span class="underline">fkill</span> {#it-is-time-for}

```shell
npm install --global fkill-cli
```

It is also available at brew

```shell
brew install fkill
```


## How to use <span class="underline">fkill</span>? {#how-to-use}


### List processes {#list-processes}

```shell
fkill
```

{{< figure src="/ox-hugo/2021-01-24_23-46-26_fkill_list_process.png" >}}


### Kill specific process that is bound to a known port {#kill-specific-process-that-is-bound-to-a-known-port}

Kills the process which is bound to 8080 port.

```shell
fkill :8080
```


### Kill a process through list, fkill helps auto completion. {#kill-a-process-through-list-fkill-helps-auto-completion-dot}

{{< figure src="/ox-hugo/2021-01-24_23-47-33_fkill_kill_whatsapp.png" >}}


## References {#references}

[fkill @github](https://github.com/sindresorhus/fkill-cli)
