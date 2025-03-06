# Yo: The Shell AI Assistant

## Introduction
Shell scripting is a vital skill for automating system tasks, but writing scripts manually can be tedious. Why not leverage the power of **Large Language Models (LLMs)** to help us execute shell commands without deep knowledge of shell scripting?

With **Ollama**, a local AI framework, we can achieve this! This guide will walk you through:

- Installing Ollama
- Downloading and serving an IBM AI model
- Creating a custom `yo` command to generate shell scripts using AI
- Using Ollama to process natural language requests
- Automatically executing the generated script from the current directory

---

## What is Ollama?
Ollama is an **open-source framework** that enables developers to run and customize **Large Language Models (LLMs)** efficiently on local machines. It provides an easy way to **download, fine-tune, and serve models** with a simple command-line interface, eliminating the need for complex cloud-based deployments.

Ollama is **performance-oriented** and allows users to integrate AI capabilities while maintaining **data privacy** and **control over computational resources**.

---

## Installing Ollama
Installing Ollama is straightforward. Follow the instructions from their official GitHub repository: [Ollama GitHub](https://github.com/ollama/ollama).

For this article, we are using the **IBM Granite3.1-dense model**: [Granite3.1-dense](https://ollama.com/library/granite3.1-dense). This model is smaller compared to many others but remains **efficient** for the tasks we require.

Once Ollama is installed, you can **pull any available model** and run it locally. Now you’re serving a large language model on your machine!

```sh
ollama pull granite3.1-dense
```

---

## Creating the `yo` Command
We’ll define a Bash function named `yo`, which will interact with **Ollama** to generate and execute scripts dynamically.

### Step 1: Download the `os_llm.sh` Script
You’ll need to download the `os_llm.sh` script onto your machine from the **GitHub repository**. This script processes your commands and interacts with Ollama.

If you want to use a different model, update the **model name** in line 13:

```sh
OLLAMA_OUTPUT=$(ollama run <your_model> "You are an expert ...")
```

Replace `<your_model>` with the model of your choice.

### Step 2: Create the `yo` Alias
Now, create an alias to make `yo` a command that calls this script:

```sh
alias yo='sh <full path>/os_llm.sh'
```

To find your **full script path**, run:
```sh
pwd
```

### Step 3: Add the Alias to Your Shell Configuration
To make this alias permanent, add it to your **shell configuration** (`.zshrc` or `.bashrc`) and reload it:

```sh
echo "alias yo='sh <full path>/os_llm.sh'" >> ~/.zshrc
source ~/.zshrc
```

Now, whenever you type `yo`, it will call your AI-powered shell assistant!

---

## How to Use `yo`
Once everything is set up, you can run shell commands using natural language! Examples:

### **Example 1: List all files**
```sh
yo "list all files in this folder"
```
**Expected Output:**
```sh
ls -la
```

### **Example 2: Find all files containing ‘error’**
```sh
yo "search for files containing 'error' inside them"
```
**Expected Output:**
```sh
grep -iRl "error" .
```

### **Example 3: Check Python Version**
```sh
yo "what is the version of Python3 installed?"
```
**Expected Output:**
```sh
python3 --version
```

---

## Improving the Shell AI Assistant
You can further enhance your `yo` command by:
- **Improving extraction**: Better parsing for more reliable execution.
- **Saving scripts**: Logging generated scripts for future reuse.
- **Using custom AI models**: Experimenting with different models in Ollama.

### **Try Running AI Commands for Containers!**
With `yo`, you can **interact with Docker**, Kubernetes, or other CLI-based tools. The **sky is the limit!**

---

## Conclusion
With this simple setup, you **no longer need to manually write shell scripts** for common tasks. Just use `yo` and let **AI handle the rest**! This is a great productivity hack for **developers, system admins, and DevOps engineers**.

🚀 Try it out and let me know what you think!

---

## Resources
- **Ollama GitHub**: [https://github.com/ollama/ollama](https://github.com/ollama/ollama)
- **IBM Granite3.1-dense model**: [https://ollama.com/library/granite3.1-dense](https://ollama.com/library/granite3.1-dense)
- **IBM Granite on Hugging Face**: [https://huggingface.co/ibm-granite/granite3.1-2b-base](https://huggingface.co/ibm-granite/granite3.1-2b-base)

---

🔗 **Follow me on LinkedIn**: [Iman Johari](https://www.linkedin.com/in/iman-johari-85b29513/)
